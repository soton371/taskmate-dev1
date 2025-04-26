import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_sizes.dart';

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
      appBar: AppBar(title: Text(taskTitleListIsarModel.taskTitle??'')),
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
                children: [RemainingTaskView(), CompletedTaskView()],
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
            builder: (_) => const AddTaskBottomSheet(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

