import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_icons.dart';
import 'package:taskmate/core/constants/app_sizes.dart';
import 'package:taskmate/features/home/widgets/in_progress_card.dart';

import '../../../core/widgets/widgets.dart';
import '../../task/presentation/pages/all_task_list_view.dart';
import '../../task/presentation/pages/task_title_create_page.dart';
import '../widgets/task_title_list.dart';
import '../widgets/today_completion_percentage.dart';
import '../widgets/upcoming_task.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //for head section
          HeadWidget(
            searchHint: 'Search list...',
            actionIcon: AppIcons.taskAdd,
            searchOnTap: (){
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (_) => AllTaskListView()),
              );
            },
            actionOnTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (_) => TaskTitleCreatePage()),
              );
            },
          ),
          //end for head section
          SizedBox(height: AppSizes.paddingBody),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                TaskTitleList(),
                SizedBox(height: AppSizes.paddingBody),
                //for task done
                TodayCompletionPercentage(),
                //end for task done
                SizedBox(height: AppSizes.paddingBody),
                //for in progress
                InProgressView(),
                //end for in progress
                SizedBox(height: AppSizes.paddingBody,),
                //for recent task, project, communication, task
                UpcomingTask(),
                //end for recent task, project, communication, task
              ],
            ),
          ),
        ],
      ),
    );
  }
}
