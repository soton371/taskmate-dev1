import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmate/core/services/db_services.dart';
import 'package:taskmate/features/task/presentation/pages/task_title_create_page.dart';

import '../../data/models/task_title_list_isar_model.dart';
import '../widgets/add_task_bottom_sheet.dart';
import '../widgets/completed_task_view.dart';
import '../widgets/remaining_task_view.dart';

class TaskTitleSinglePage extends StatelessWidget {
  const TaskTitleSinglePage({super.key, required this.taskTitleListIsarModel});

  final TaskTitleListIsarModel taskTitleListIsarModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(taskTitleListIsarModel.taskTitle??''),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: const Text("Delete"),
              ),
              PopupMenuItem(
                value: 2,
                child: const Text("Rename"),
              ),
            ],
            // on selected we show the dialog box
            onSelected: (value) async{
              if(value == 1){
                final db = DBServices.db;
                await db.writeTxn(() async {
                  await db.taskTitleListIsarModels.delete(taskTitleListIsarModel.id); // delete
                });
                Navigator.pop(context);
              }else if(value == 2){
                Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_)=> TaskTitleCreatePage(taskTitleListIsarModel: taskTitleListIsarModel,)));
              }
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            //for tab bar
            TabBar(tabs: [Tab(text: "Remaining"), Tab(text: "Completed")]),
            //end for tab bar

            //for tab view
            Expanded(
              child: TabBarView(
                children: [RemainingTaskView(taskTitleListIsarModel: taskTitleListIsarModel,), CompletedTaskView(taskTitleListIsarModel: taskTitleListIsarModel)],
              ),
            ),
            //end for tab view
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => AddTaskBottomSheet(taskTitleListIsarModel: taskTitleListIsarModel,),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

