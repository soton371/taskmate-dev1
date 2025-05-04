import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_values.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/utilities/app_string_modify.dart';

class ActiveUsers extends StatelessWidget {
  const ActiveUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final activeUsers = AppValues.chatList.where((test)=> test['sender_active']==true).toList();
    return Container(
      height: AppSizes.height(context, 100),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.2)),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: activeUsers.length,
        itemBuilder: (_, i) {
          final activeUser=activeUsers[i];
          return Container(
            width: 90,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSizes.cardRadius,
                      ),
                      child: activeUser["sender_img"] == null? Container(
                        color: AppColors.randomColor(),
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        child: Text(firstLetter(activeUser["sender_name"])??'S',style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.scaffoldBg, fontSize: AppSizes.fontSizeOverLarge),),
                      ) :
                      Image.asset(
                        activeUser["sender_img"],
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: AppColors.scaffoldBg,
                        ),
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: AppColors.active,
                          ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(onlyFirstWord(activeUser['sender_name'])??'Unknown',
                  style: TextStyle(fontSize: AppSizes.fontSizeSmall),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
