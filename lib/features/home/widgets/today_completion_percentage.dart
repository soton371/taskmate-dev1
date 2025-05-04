import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/services/db_services.dart';
import '../../task/data/models/task_title_list_isar_model.dart';
import '../../task/presentation/pages/all_task_list_view.dart';

class TodayCompletionPercentage extends StatefulWidget {
  const TodayCompletionPercentage({super.key});

  @override
  State<TodayCompletionPercentage> createState() => _TodayCompletionPercentageState();
}

class _TodayCompletionPercentageState extends State<TodayCompletionPercentage> {

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

  double calculateOverallTodayTaskCompletionPercentage(List<TaskTitleListIsarModel> models) {
    int totalCompleted = 0;
    int totalRemains = 0;

    for (final model in models) {
      totalCompleted += model.totalCompletedTaskCount ?? 0;
      totalRemains += model.totalRemainsTaskCount ?? 0;
    }

    final totalTasks = totalCompleted + totalRemains;

    if (kDebugMode) {
      print("object totalCompleted: $totalCompleted totalTasks: $totalTasks");
    }

    if (totalTasks == 0) return 0.0; // avoid division by zero

    return (totalCompleted / totalTasks) * 100;
  }



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TaskTitleListIsarModel>>(
      stream: taskTitleListStream,
      builder: (context, snapshot) {
        final taskTitleList = snapshot.data??[];

        final overallPercentage = calculateOverallTodayTaskCompletionPercentage(taskTitleList);

        return taskTitleList.isEmpty ? SizedBox.shrink() : Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppSizes.paddingBody,
          ),
          padding: EdgeInsets.all(AppSizes.paddingInside),
          decoration: BoxDecoration(
            gradient: AppColors.gradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(overallPercentage>10 && overallPercentage<70?
                    "You've made excellent \nprogress!\n" : overallPercentage>70 && overallPercentage<100?  "Your task almost \ndone!\n" : "Get started on \nyour task\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(100, 15),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (_) => AllTaskListView()),
                      );
                    },
                    child: Text(
                      "View Task",
                      style: TextStyle(
                        fontSize: AppSizes.fontSizeSmall,
                      ),
                    ),
                  ),
                ],
              ),
              CircularPercentIndicator(
                radius: 50.0,
                lineWidth: 7.0,
                percent: overallPercentage/100,
                center: Text(
                  "${overallPercentage.toStringAsFixed(0)}%",
                  style: TextStyle(color: Colors.white),
                ),
                progressColor: Colors.white,
                backgroundColor: Colors.white24,
                reverse: true,
                animation: true,
                animationDuration: 900,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ],
          ),
        );
      },
    );
  }
}
