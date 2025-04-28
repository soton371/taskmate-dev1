import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:taskmate/features/task/presentation/pages/task_title_single_page.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/services/db_services.dart';
import '../../../core/utilities/app_string_modify.dart';
import '../../task/data/models/task_title_list_isar_model.dart';
import '../../task/presentation/pages/task_title_create_page.dart';

class TaskTitleList extends StatefulWidget {
  const TaskTitleList({super.key});

  @override
  State<TaskTitleList> createState() => _TaskTitleListState();
}

class _TaskTitleListState extends State<TaskTitleList> {

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.height(context, 105),
      child: StreamBuilder<List<TaskTitleListIsarModel>>(
          stream: taskTitleListStream,
          builder: (context, snapshot) {
            final taskTitleList = snapshot.data??[];
            return ListView.builder(
              itemCount: taskTitleList.length + 1, // extra for "New List" button
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                if (i < taskTitleList.length) {
                  final taskTitle = taskTitleList[i];
                  return Padding(
                    padding: const EdgeInsets.only(left: AppSizes.paddingBody),
                    child: TaskTitleCard(
                      onTap: () {
                        // route title page for showing tasks by title
                        Navigator.push(context, CupertinoPageRoute(builder: (_)=>TaskTitleSinglePage(taskTitleListIsarModel: taskTitle)));
                      },
                      count: "${taskTitle.totalRemainsTaskCount??0}",
                      title: taskTitle.taskTitle??'Unknown',
                      completed: taskTitle.totalRemainsTaskCount != null &&
                          taskTitle.totalRemainsTaskCount == 0,
                    ),
                  );
                } else {
                  // This is the last item: the "New List" card
                  return Padding(
                    padding: const EdgeInsets.only(left: AppSizes.paddingBody),
                    child: TaskTitleCard(
                      onTap: () {
                        // open modal or page to add a new list
                        Navigator.push(context, CupertinoPageRoute(builder: (_)=>TaskTitleCreatePage()));
                      },
                      count: '+',
                      title: "New List",
                    ),
                  );
                }
              },
            );
          }
      ),
    );
  }
}



class TaskTitleCard extends StatelessWidget {
  const TaskTitleCard({super.key, required this.count, required this.title, this.completed, this.onTap});
  final String? count;
  final String title;
  final bool? completed;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSizes.paddingInside),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.cardRadius),
            border: Border.all(width: 0.5, color: AppColors.border)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (completed != null) ?
            Container(
              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.lightGrey
                ),
                child: completed == true ? Icon(AppIcons.task, color: AppColors.selected, size: AppSizes.fontSizeLarge,) : Text(formatToTwoDigits(count??'00'), style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.fontSizeSmall,
                    color: completed == true ? AppColors.selected : null
                ),maxLines: 1,overflow: TextOverflow.ellipsis),):
            Container(
              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.lightGrey
              ),
              child: Icon(AppIcons.add, size: AppSizes.fontSizeLarge,),),
            Text(title, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSizes.fontSizeSmall,
                color: completed == true ? AppColors.selected : null
            ),maxLines: 1,overflow: TextOverflow.ellipsis),
            if(completed != null)
            Text(completed == true ? "Completed":"Remaining", style: TextStyle(
                fontSize: AppSizes.fontSizeExtraSmall,
                color: AppColors.subtitle
            ),maxLines: 1,overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
