import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_sizes.dart';
import 'package:taskmate/features/task/data/models/task_title_list_isar_model.dart';

import '../../../../core/utilities/app_date_time.dart';
import '../bloc/task_bloc.dart';
import '../pages/task_single_page.dart';

class RemainingTaskView extends StatefulWidget {
  const RemainingTaskView({super.key, required this.taskTitleListIsarModel});

  final TaskTitleListIsarModel taskTitleListIsarModel;

  @override
  State<RemainingTaskView> createState() => _RemainingTaskViewState();
}

class _RemainingTaskViewState extends State<RemainingTaskView> {

  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(GetRemainingTaskEvent(widget.taskTitleListIsarModel));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state){
            if(state is RemainingTaskSuccess){
              final groupedTask = state.groupedTask;
              return groupedTask.isEmpty
                  ? Center(child: Text("Empty"))
                  : ListView(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
                children:
                groupedTask.entries.map((entry) {
                  final sectionTitle = entry.key;
                  final tasks = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppSizes.paddingBody * 2),
                      Text(
                        sectionTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                          sectionTitle == "Today"
                              ? AppColors.seed
                              : sectionTitle == "Past"
                              ? Colors.red
                              : null,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: tasks.length,
                        itemBuilder: (_, i) {
                          final task = tasks[i];
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.scaffoldBg,
                              boxShadow: AppColors.boxShadow,
                              borderRadius: BorderRadius.circular(
                                AppSizes.cardRadius,
                              ),
                            ),
                            margin: EdgeInsets.only(
                              top: AppSizes.paddingInside,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSizes.paddingInside,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: task.completedAt != null,
                                  onChanged: (onChanged) async {
                                    context.read<TaskBloc>().add(CompletedTaskActionEvent(taskTitleListIsarModel:widget.taskTitleListIsarModel, task: task));
                                  },
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, CupertinoPageRoute(builder: (_)=> TaskSinglePage(task: task,taskTitleListIsarModel: widget.taskTitleListIsarModel,)));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: AppSizes.paddingInside),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            task.name ?? '',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
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
                                          if (task.taskDateTime != null)
                                            Text(
                                              formatDateTime(
                                                dateTime: task.taskDateTime,
                                                format: 'hh:mm a',
                                              ) ??
                                                  '',
                                              style: TextStyle(
                                                color: AppColors.subtitle,
                                                fontSize: AppSizes.fontSizeSmall,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }).toList(),
              );
            }else{
              return Center(child: Text("Empty"));
            }
          }
      ),
    );
  }
}
