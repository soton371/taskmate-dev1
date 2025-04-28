import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:taskmate/features/task/data/models/task_title_list_isar_model.dart';
import 'package:taskmate/features/task/presentation/pages/task_title_create_page.dart';
import 'package:taskmate/features/task/presentation/pages/task_title_single_page.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/services/db_services.dart';

class AllTaskListView extends StatefulWidget {
  const AllTaskListView({super.key});

  @override
  State<AllTaskListView> createState() => _AllTaskListViewState();
}

class _AllTaskListViewState extends State<AllTaskListView> {
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
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: AppColors.gradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
              ),
            ),
            padding: EdgeInsets.all(AppSizes.paddingBody),
            child: Column(
              children: [
                SizedBox(height: AppSizes.height(context, 60)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(
                      AppSizes.textFieldRadius,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),

                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Search task title',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            isDense: true,
                            isCollapsed: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<TaskTitleListIsarModel>>(
              stream: taskTitleListStream,
              builder: (context, snapshot) {
                final taskTitleList = snapshot.data ?? [];
                return taskTitleList.isEmpty
                    ? Center(child: Text("Empty"))
                    : ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.paddingBody,
                      ),
                      itemCount: taskTitleList.length,
                      itemBuilder: (context, i) {
                        final taskTitle = taskTitleList[i];
                        final completed =
                            taskTitle.totalRemainsTaskCount != null &&
                            taskTitle.totalRemainsTaskCount == 0;
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (_)=>TaskTitleSinglePage(taskTitleListIsarModel: taskTitle)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.scaffoldBg,
                              boxShadow: AppColors.boxShadow,
                              borderRadius: BorderRadius.circular(
                                AppSizes.cardRadius,
                              ),
                            ),
                            margin: EdgeInsets.only(top: AppSizes.paddingBody),
                            padding: const EdgeInsets.all(AppSizes.paddingBody),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.lightGrey,
                                  ),
                                  child:
                                      completed == true
                                          ? Icon(
                                            AppIcons.task,
                                            color: AppColors.selected,
                                            size: AppSizes.fontSizeLarge,
                                          )
                                          : Text(
                                            "${taskTitle.totalRemainsTaskCount ?? '0'}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: AppSizes.fontSizeLarge,
                                              color:
                                                  completed == true
                                                      ? AppColors.selected
                                                      : null,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                ),
                                SizedBox(width: AppSizes.paddingBody),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        taskTitle.taskTitle ?? 'Unknown',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AppSizes.fontSizeLarge,
                                          color:
                                              completed == true
                                                  ? AppColors.selected
                                                  : null,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        completed == true
                                            ? "Completed"
                                            : "Remaining",
                                        style: TextStyle(
                                          color: AppColors.subtitle,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (_) => TaskTitleCreatePage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
