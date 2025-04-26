import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_icons.dart';
import 'package:taskmate/core/constants/app_sizes.dart';
import 'package:taskmate/features/home/widgets/in_progress_card.dart';

import '../../../core/widgets/widgets.dart';
import '../../task/presentation/pages/all_task_list_view.dart';
import '../../task/presentation/pages/task_title_create_page.dart';
import '../widgets/service_card.dart';
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
          TaskTitleList(),
          SizedBox(height: AppSizes.paddingBody),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                //for task done
                Container(
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
                        children: [
                          Text(
                            "Your today's task\nalmost done!\n",
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
                        percent: 0.85,
                        center: Text(
                          "85%",
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
                ),
                //end for task done
                SizedBox(height: AppSizes.paddingBody),
                //for in progress
                InProgressView(),
                //end for in progress
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
