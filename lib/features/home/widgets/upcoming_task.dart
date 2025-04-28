import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/utilities/app_date_time.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/services/db_services.dart';
import '../../task/data/models/task_title_list_isar_model.dart';

class UpcomingTask extends StatefulWidget {
  const UpcomingTask({super.key});

  @override
  State<UpcomingTask> createState() => _UpcomingTaskState();
}

class _UpcomingTaskState extends State<UpcomingTask> {
  late Stream<List<TaskTitleListIsarModel>> taskTitleListStream;

  @override
  void initState() {
    super.initState();
    // Create a stream that watches for changes in the Todo collection
    final tt = DBServices.db.taskTitleListIsarModels;
    taskTitleListStream = tt
        .watchLazy(fireImmediately: true)
        .asyncMap((_) => tt.where().findAll());
  }

  Future<List<TaskIsarModel>> getTodayRemainingTasks(List<TaskTitleListIsarModel> models) async {
    final List<TaskIsarModel> todayRemainingTasks = [];

    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);

    for (final model in models) {
      await model.tasks.load();

      for (final task in model.tasks) {
        if (task.taskDateTime != null) {
          final taskDate = DateTime.tryParse(task.taskDateTime!);
          if (taskDate != null) {
            final taskDateOnly = DateTime(taskDate.year, taskDate.month, taskDate.day);
            if (taskDateOnly == todayOnly && task.completedAt == null) {
              todayRemainingTasks.add(task);
            }
          }
        }
      }
    }

    return todayRemainingTasks;
  }




  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TaskTitleListIsarModel>>(
      stream: taskTitleListStream,
      builder: (context, snapshot) {

        final models = snapshot.data??[];

        return FutureBuilder<List<TaskIsarModel>>(
          future: getTodayRemainingTasks(models),
          builder: (context, taskSnapshot) {

            final todayRemainingTasks = taskSnapshot.data??[];

            return todayRemainingTasks.isEmpty ? SizedBox.shrink() : ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: todayRemainingTasks.length,
              itemBuilder: (context, index) {
                final task = todayRemainingTasks[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody, vertical: AppSizes.paddingInside),
                  padding: EdgeInsets.all(AppSizes.paddingInside),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border, width: 0.5),
                      borderRadius: BorderRadius.circular(AppSizes.cardRadius)
                  ),
                  child: InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.randomPastelColor().withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(Icons.watch_later_outlined, size: 18,),
                        ),
                        SizedBox(width: AppSizes.paddingInside,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(task.name??'', style: TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                              if(task.details != null)
                              Text(task.details??'', style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.subtitle),maxLines: 2,overflow: TextOverflow.ellipsis),
                              Text(formatDateTime(dateTime:task.taskDateTime, format: 'hh:mm a')??'', style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.subtitle, fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
