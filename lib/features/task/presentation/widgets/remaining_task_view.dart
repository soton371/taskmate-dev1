import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_sizes.dart';
import 'package:taskmate/features/task/data/models/task_title_list_isar_model.dart';

import '../../../../core/utilities/app_date_time.dart';

class RemainingTaskView extends StatefulWidget {
  const RemainingTaskView({super.key, required this.taskTitleListIsarModel});
  final TaskTitleListIsarModel taskTitleListIsarModel;

  @override
  State<RemainingTaskView> createState() => _RemainingTaskViewState();
}

class _RemainingTaskViewState extends State<RemainingTaskView> {
  // List<TaskIsarModel> _tasks = [];
  Map<String, List<TaskIsarModel>> groupedTask = {};

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  final today = DateTime.now();
  Future<void> _fetchTasks() async {
    await widget.taskTitleListIsarModel.tasks.load();
    final taskList = widget.taskTitleListIsarModel.tasks.toList();
    Map<String, List<TaskIsarModel>> grouped = {};
    for (var newTask in taskList) {
      if(newTask.completedAt != null){
        return;
      }
      String key = 'No date';
      if(newTask.taskDateTime == null){
        key = 'No date';
        if (!grouped.containsKey(key)) {
          grouped[key] = [];
        }
        grouped[key]!.add(newTask);
      }else{
        DateTime taskDate = DateTime.parse(newTask.taskDateTime!);
        final taskDateOnly = DateTime(taskDate.year, taskDate.month, taskDate.day);
        final todayOnly = DateTime(today.year, today.month, today.day);

        if(taskDateOnly == todayOnly){
          key = 'Today';
        }else if(taskDateOnly.isBefore(todayOnly)){
          key = 'Past';
        }else{
          key = formatDateTime(dateTime: taskDateOnly, format: 'E, d MMMM')??'No date';
        }
        if (!grouped.containsKey(key)) {
          grouped[key] = [];
        }
        grouped[key]!.add(newTask);
      }
    }

    setState(() {
      groupedTask = grouped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all( AppSizes.paddingBody),
        children: groupedTask.entries.map((entry) {
          final sectionTitle = entry.key;
          final tasks = entry.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sectionTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:sectionTitle == "Today"? AppColors.seed: sectionTitle == "Past" ? Colors.red:null,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: tasks.length,
                  itemBuilder: (_,i){
                    final task = tasks[i];
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.scaffoldBg,
                        boxShadow: AppColors.boxShadow,
                        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                      ),
                      margin: EdgeInsets.only(top: AppSizes.paddingBody),
                      padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingInside),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(value: task.completedAt != null, onChanged: (onChanged) {}),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(task.name??'',
                                style: TextStyle(fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              if(task.details != null)
                                Text(task.details??'',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: AppColors.subtitle,
                                    fontSize: AppSizes.fontSizeSmall,
                                  ),
                                ),
                              Text(
                                "10 am",
                                style: TextStyle(
                                  color: AppColors.subtitle,
                                  fontSize: AppSizes.fontSizeSmall,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          );
        }).toList(),
      ),
    );
  }
}
