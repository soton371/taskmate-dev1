import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmate/features/task/data/models/task_title_list_isar_model.dart';
import 'package:taskmate/features/task/presentation/pages/task_title_create_page.dart';
import 'package:taskmate/features/task/presentation/pages/task_title_single_page.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_sizes.dart';

class AllTaskListView extends StatelessWidget {
  const AllTaskListView({super.key});

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
                SizedBox(height: AppSizes.height(context, 60),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(
                      AppSizes.textFieldRadius,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back_ios, color: Colors.white),),

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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
              itemCount: 5,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: (){
                    // Navigator.push(context, CupertinoPageRoute(builder: (_)=>TaskTitleSinglePage(taskTitleListIsarModel: TaskTitleListIsarModel())));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.scaffoldBg,
                      boxShadow: AppColors.boxShadow,
                      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                    ),
                    margin: EdgeInsets.only(top: AppSizes.paddingBody),
                    padding: const EdgeInsets.all(AppSizes.paddingBody),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.lightGrey
                          ),
                          // child: completed == true ? Icon(AppIcons.task, color: AppColors.selected, size: AppSizes.fontSizeLarge,) : Text(count??'0', style: TextStyle(
                          child: i&1 == 0 ? Icon(AppIcons.task, color: AppColors.selected, size: AppSizes.fontSizeExtraLarge,) : Text('0${i+1}', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppSizes.fontSizeLarge,
                              color: i&1 == 0 ? AppColors.selected : null
                              // color: completed == true ? AppColors.selected : null
                          ),maxLines: 1,overflow: TextOverflow.ellipsis),),
                        SizedBox(width: AppSizes.paddingBody,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Title $i", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSizes.fontSizeLarge,
                                  color: i&1 == 0 ? AppColors.selected : null
                                  // color: completed == true ? AppColors.selected : null
                              ),maxLines: 1,overflow: TextOverflow.ellipsis),
                              // if(completed != null)
                                Text(i&1 == 0 ? "Completed":"Remaining", style: TextStyle(
                                // Text(completed == true ? "Completed":"Remaining", style: TextStyle(
                                    color: AppColors.subtitle
                                ),maxLines: 1,overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, CupertinoPageRoute(builder: (_)=>TaskTitleCreatePage()));
      },child: Icon(Icons.add),),
    );
  }
}
