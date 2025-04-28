import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmate/app/routes/app_routes.dart';
import 'package:taskmate/features/activity/pages/activity_page.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/app_input_widgets.dart';
import '../../profile/pages/profile_page.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 185,
            decoration: BoxDecoration(
              gradient: AppColors.gradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
              ),
            ),
            padding: EdgeInsets.all(AppSizes.paddingBody),
            child: Column(
              children: [
                SizedBox(height: 50),
                //for name and image
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Soton Ahmed",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.fontSizeOverLarge,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (_) => ProfilePage()),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              AppSizes.cardRadius,
                            ),
                            child: Image.asset(
                              AppImages.user,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: AppColors.active,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end for name and image
                SizedBox(height: AppSizes.paddingBody),
                //for search and filter
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          // Navigator.push(context, CupertinoPageRoute(builder: (_)=> SearchPage()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(AppSizes.paddingInside),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(
                              AppSizes.textFieldRadius,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(AppIcons.search, color: Colors.white),
                              Text(
                                "   Jump to or search...",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: AppSizes.paddingBody),
                    //for filter icon
                    InkWell(
                      onTap: (){
                        appBottomSheet(context, child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("   Sort By", style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: AppSizes.paddingInside*2,),
                            Row(
                              children: [
                                Icon(AppIcons.upDown, size: 16,),
                                Text("   Most relevant", style: TextStyle(fontSize: AppSizes.fontSizeLarge),),
                              ],
                            ),
                            SizedBox(height: AppSizes.paddingBody,),
                            Row(
                              children: [
                                Icon(AppIcons.session, size: 16),
                                Text("   Session", style: TextStyle(fontSize: AppSizes.fontSizeLarge),),
                              ],
                            ),
                            SizedBox(height: AppSizes.paddingBody,),
                            Row(
                              children: [
                                Icon(AppIcons.project, size: 16),
                                Text("   Project", style: TextStyle(fontSize: AppSizes.fontSizeLarge),),
                              ],
                            ),
                            SizedBox(height: AppSizes.paddingBody,),
                            Row(
                              children: [
                                Icon(AppIcons.communication, size: 16),
                                Text("   Communication", style: TextStyle(fontSize: AppSizes.fontSizeLarge),),
                              ],
                            ),
                          ],
                        ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(AppSizes.paddingInside),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(
                            AppSizes.textFieldRadius,
                          ),
                        ),
                        child: Icon(AppIcons.filter, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                //end for search and filter
              ],
            ),
          ),
          //for more option list
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.currencySelectionPage);
            },
            child: Container(
              padding: EdgeInsets.all(AppSizes.paddingBody),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.1, color: AppColors.subtitle))
              ),
              child: Row(
                children: [
                  Icon(AppIcons.calculator),
                  SizedBox(width: AppSizes.paddingBody,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cashbook",style: TextStyle(fontSize: AppSizes.fontSizeLarge),),
                      Text("Smartly manage your accounts",style: TextStyle(color: AppColors.subtitle),),
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=> ActivityPage(title: "Assigned to you",)));
            },
            child: Container(
              padding: EdgeInsets.all(AppSizes.paddingBody),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.1, color: AppColors.subtitle))
              ),
              child: Row(
                children: [
                  Icon(AppIcons.connect),
                  SizedBox(width: AppSizes.paddingBody,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Assigned to you",style: TextStyle(fontSize: AppSizes.fontSizeLarge),),
                      Text("Check off your task",style: TextStyle(color: AppColors.subtitle),),
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=> ActivityPage(title: "You have allocated",)));
            },
            child: Container(
              padding: EdgeInsets.all(AppSizes.paddingBody),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.1, color: AppColors.subtitle))
              ),
              child: Row(
                children: [
                  Icon(AppIcons.connect),
                  SizedBox(width: AppSizes.paddingBody,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("You have allocated",style: TextStyle(fontSize: AppSizes.fontSizeLarge),),
                      Text("You assigned someone else",style: TextStyle(color: AppColors.subtitle),),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
