import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/services/db_services.dart';
import '../../../../core/utilities/app_date_time.dart';
import '../../data/models/task_title_list_isar_model.dart';

class CompletedTaskView extends StatefulWidget {
  const CompletedTaskView({super.key, required this.taskTitleListIsarModel});

  final TaskTitleListIsarModel taskTitleListIsarModel;

  @override
  State<CompletedTaskView> createState() => _CompletedTaskViewState();
}

class _CompletedTaskViewState extends State<CompletedTaskView> {
  List<TaskIsarModel> completedTaskList = [];

  @override
  void initState() {
    super.initState();
    _fetchCompletedTasks();
  }

  Future<void> _fetchCompletedTasks() async {
    await widget.taskTitleListIsarModel.tasks.load();
    final taskList = widget.taskTitleListIsarModel.tasks.toList();
    List<TaskIsarModel> temp = [];
    for (var newCompletedTask in taskList) {
      if (newCompletedTask.completedAt != null) {
        temp.add(newCompletedTask);
      }
    }

    setState(() {
      completedTaskList = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          completedTaskList.isEmpty
              ? Center(child: Text("Empty"))
              : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
                itemCount: completedTaskList.length,
                itemBuilder: (_, i) {
                  final task = completedTaskList[i];
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.scaffoldBg,
                      boxShadow: AppColors.boxShadow,
                      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                    ),
                    margin: EdgeInsets.only(top: AppSizes.paddingInside),
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.paddingInside,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: task.completedAt != null,
                          onChanged: (onChanged) async {
                            int? todayRemainsTaskCount;
                            int? todayCompletedTaskCount;
                            todayRemainsTaskCount =
                                widget
                                    .taskTitleListIsarModel
                                    .totalRemainsTaskCount;
                            todayCompletedTaskCount =
                                widget
                                    .taskTitleListIsarModel
                                    .totalCompletedTaskCount;
                            if (todayRemainsTaskCount != null) {
                              todayRemainsTaskCount++;
                            } else {
                              todayRemainsTaskCount = 1;
                            }
                            if (todayCompletedTaskCount != null) {
                              todayCompletedTaskCount--;
                            } else {
                              todayCompletedTaskCount = 0;
                            }

                            final db = DBServices.db;
                            await db.writeTxn(() async {
                              task.completedAt = null;
                              await db.taskIsarModels.put(task);
                              widget
                                      .taskTitleListIsarModel
                                      .totalRemainsTaskCount =
                                  todayRemainsTaskCount;
                              widget
                                      .taskTitleListIsarModel
                                      .totalCompletedTaskCount =
                                  todayCompletedTaskCount;
                              await db.taskTitleListIsarModels.put(
                                widget.taskTitleListIsarModel,
                              );
                            });
                            _fetchCompletedTasks();
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.name ?? '',
                              style: TextStyle(fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            if (task.details != null)
                              Text(
                                task.details ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: AppColors.subtitle,
                                  fontSize: AppSizes.fontSizeSmall,
                                ),
                              ),
                            Text(
                              "Completed at ${formatDateTime(dateTime: task.completedAt, format: 'E, dd MMM hh:mm a') ?? ''}",
                              style: TextStyle(
                                color: AppColors.subtitle,
                                fontSize: AppSizes.fontSizeSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
