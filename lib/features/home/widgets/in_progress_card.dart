import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/services/db_services.dart';
import '../../task/data/models/task_title_list_isar_model.dart';
import '../../task/presentation/pages/task_title_single_page.dart';

class InProgressCard extends StatelessWidget {
  const InProgressCard({
    super.key,
    required this.subTitle,
    required this.title,
    required this.percent,
    required this.color,
    this.onTap
  });

  final String subTitle, title;
  final double percent;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppSizes.width(context, 200),
        margin: EdgeInsets.only(
          left: AppSizes.paddingBody,
          top: AppSizes.paddingInside,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        ),
        padding: EdgeInsets.all(AppSizes.paddingInside),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subTitle,
              style: TextStyle(
                color: AppColors.subtitle,
                fontSize: AppSizes.fontSizeSmall,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: AppSizes.paddingBody),
            LinearPercentIndicator(
              lineHeight: 7.0,
              percent: percent,
              backgroundColor: Colors.white,
              progressColor: color,
              animation: true,
              animationDuration: 900,
              barRadius: Radius.circular(50),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}

class InProgressView extends StatefulWidget {
  const InProgressView({super.key});

  @override
  State<InProgressView> createState() => _InProgressViewState();
}

class _InProgressViewState extends State<InProgressView> {
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

  double calculateTodayTaskCompletionPercentage(TaskTitleListIsarModel model) {
    final completed = model.totalCompletedTaskCount ?? 0;
    final remains = model.totalRemainsTaskCount ?? 0;
    final totalTasks = completed + remains;

    if (totalTasks == 0) return 0.0;

    return completed / totalTasks;
  }



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TaskTitleListIsarModel>>(stream: taskTitleListStream, builder: (context, snapshot) {
      final taskTitleList = snapshot.data??[];
      final inProgressList = taskTitleList.where((task) {
        final remains = task.totalRemainsTaskCount ?? 0;
        final total = (task.totalCompletedTaskCount ?? 0) + remains;
        return remains > 0 && total > 0;
      }).toList();

      return inProgressList.isEmpty ? SizedBox.shrink(): Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingBody,
            ),
            child: Text(
              "In Progress",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: inProgressList.length,
              itemBuilder: (_,i){
                final taskTitle = inProgressList[i];
                final pp = calculateTodayTaskCompletionPercentage(taskTitle);
                return InProgressCard(
                  onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (_)=>TaskTitleSinglePage(taskTitleListIsarModel: taskTitle)));
                  },
                  subTitle: "${taskTitle.totalCompletedTaskCount??0} out of ${(taskTitle.totalRemainsTaskCount??0)+(taskTitle.totalCompletedTaskCount??0)} tasks completed",
                  title: taskTitle.taskTitle ?? "Unknown",
                  percent: pp,
                  color: AppColors.randomPastelColor(),
                );
              },
            ),
          ),
        ],
      );
    });

  }
}
