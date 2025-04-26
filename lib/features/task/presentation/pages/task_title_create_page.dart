import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmate/features/task/presentation/pages/task_title_single_page.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../data/datasources/task_local_data_source.dart';
import '../../data/models/task_title_list_isar_model.dart';

class TaskTitleCreatePage extends StatefulWidget {
  const TaskTitleCreatePage({super.key});

  @override
  State<TaskTitleCreatePage> createState() => _TaskTitleCreatePageState();
}

class _TaskTitleCreatePageState extends State<TaskTitleCreatePage> {
  final TextEditingController titleCon = TextEditingController();
  final ValueNotifier<bool> isTextNotEmptyNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    titleCon.addListener(() {
      isTextNotEmptyNotifier.value = titleCon.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    titleCon.dispose();
    isTextNotEmptyNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new list"),
        actions: [
          ValueListenableBuilder(
              valueListenable: isTextNotEmptyNotifier,
              builder: (_,value,child)=> TextButton(onPressed: value ? ()async{
                TaskTitleListIsarModel model = TaskTitleListIsarModel();
                model.taskTitle = titleCon.text;
                model.todayRemainsTaskCount = 0;
                model.todayTotalTaskCount = 0;
                await TaskLocalDataSource().saveTaskTitle(model);
                // find id then route
                //route single task page for create task
                Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_)=>TaskTitleSinglePage(taskTitleListIsarModel: model,)));
              }:null, child: Text("Next",style: TextStyle(fontWeight: FontWeight.bold),))
          ),
        ],
      ),
      body: ListView(
          children: [
            SizedBox(height: AppSizes.paddingBody,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
              child: Text("Enter list title", style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppSizes.fontSizeLarge),),
            ),
            TextFormField(
              controller: titleCon,
              decoration: InputDecoration(
                hintText: "ex. Meetings",
                prefixIcon: Icon(AppIcons.list)
              ),
            ),
            SizedBox(height: AppSizes.paddingBody,),
            Container(
              margin: EdgeInsets.all(AppSizes.paddingBody),
              padding: EdgeInsets.all(AppSizes.paddingInside),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                  color: AppColors.randomPastelColor().withValues(alpha: 0.1)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(AppIcons.list),
                  SizedBox(width: AppSizes.paddingInside,),
                  Expanded(child: Text("Assign a title to your work collection, providing a clear label where you will later organize and number the numerous individual work items.")),
                ],
              ),
            ),
            // ElevatedButton(onPressed: ()async{
            //   final aa = await TaskLocalDataSource().getAllTaskTitles();
            //   print("object aa: ${aa.length}");
            // }, child: Text("data get"))
          ]
      ),
    );
  }
}
