import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_values.dart';
import 'package:taskmate/features/home/widgets/recent_card.dart';

import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/services/db_services.dart';
import '../../../core/utilities/app_string_modify.dart';

class UpcomingTask extends StatefulWidget {
  const UpcomingTask({super.key});

  @override
  State<UpcomingTask> createState() => _UpcomingTaskState();
}

class _UpcomingTaskState extends State<UpcomingTask> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (_, i) {
            // final scTask = scTasks[i];
            return Column(
              children: [
                RecentCard(
                  onTap: (){

                  },
                  color: AppColors.randomColor(),
                  title:
                      capitalizeFirstLetter("category.name") ?? '',
                  subTitle: 'Task',
                  iconData: AppIcons.findIcon(CategoryType.communication),
                ),
                SizedBox(height: AppSizes.paddingBody),
              ],
            );
          },
        );
  }
}
