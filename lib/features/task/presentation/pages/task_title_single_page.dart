import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_sizes.dart';

import '../widgets/add_task_bottom_sheet.dart';
import '../widgets/completed_task_view.dart';
import '../widgets/remaining_task_view.dart';

class TaskTitleSinglePage extends StatelessWidget {
  const TaskTitleSinglePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
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

