import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_sizes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("You")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppSizes.paddingBody),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            AppImages.user,
                            height: 60,
                            width: 60,
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: AppColors.scaffoldBg,
                            ),
                            CircleAvatar(
                              radius: 7,
                              backgroundColor: AppColors.active,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: AppSizes.paddingInside * 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Soton Ahmed",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.fontSizeExtraLarge,
                          ),
                        ),
                        Text(
                          "Active",
                          style: TextStyle(color: AppColors.subtitle),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.paddingBody * 2),
                Container(
                  padding: EdgeInsets.all(AppSizes.paddingInside),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: AppColors.subtitle),
                    borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                  ),
                  child: Row(
                    children: [
                      Icon(AppIcons.smile, color: AppColors.subtitle),
                      Text(
                        "  Update your status",
                        style: TextStyle(color: AppColors.subtitle),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSizes.paddingInside * 2),
                ProfileTile(
                  iconData: AppIcons.notificationOff,
                  title: "Pause notification",
                ),
                SizedBox(height: AppSizes.paddingInside * 2),
                ProfileTile(
                  iconData: AppIcons.userInactive,
                  title: "Set yourself as away",
                ),
              ],
            ),
          ),
          Divider(thickness: 0.5),
          Padding(
            padding: EdgeInsets.all(AppSizes.paddingBody),
            child: Column(
              children: [
                ProfileTile(
                  iconData: AppIcons.connect,
                  title: "Invitation to connect",
                ),
                SizedBox(height: AppSizes.paddingInside * 2),
                ProfileTile(
                  iconData: AppIcons.user,
                  title: "View profile",
                ),
                SizedBox(height: AppSizes.paddingInside * 2),
                ProfileTile(
                  iconData: AppIcons.reminder,
                  title: "Reminders",
                ),
                SizedBox(height: AppSizes.paddingInside * 2),
                ProfileTile(
                  iconData: AppIcons.logout,
                  title: "Logout",
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key, required this.iconData, required this.title, this.color});

  final IconData iconData;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, color: color,),
        SizedBox(width: AppSizes.paddingBody,),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }
}
