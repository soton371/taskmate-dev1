import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_images.dart';
import 'package:taskmate/core/constants/app_sizes.dart';
import 'package:taskmate/features/direct_message/page/create_group_page.dart';
import 'package:taskmate/features/direct_message/page/message_page.dart';

import '../../../core/constants/app_icons.dart';
import '../../more/widgets/active_users.dart';
import '../../profile/pages/profile_page.dart';
import '../../search/pages/search_page.dart';

class DirectMessagePage extends StatelessWidget {
  const DirectMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                    "Direct message",
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
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   CupertinoPageRoute(builder: (_) => SearchPage()),
                        // );
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
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (_)=> CreateGroupPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppSizes.paddingInside),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(
                          AppSizes.textFieldRadius,
                        ),
                      ),
                      child: Icon(AppIcons.create, color: Colors.white),
                    ),
                  ),
                ],
              ),
              //end for search and filter
            ],
          ),
        ),

        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              //for Active users
              ActiveUsers(),
              //end for Active users
              SizedBox(height: AppSizes.paddingBody,),
              //for chat list
              ListView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: AppSizes.paddingBody),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (_)=>MessagePage()));
                      },
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  AppSizes.cardRadius,
                                ),
                                child: Image.asset(
                                  AppImages.user,
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 6,
                                    backgroundColor: AppColors.scaffoldBg,
                                  ),
                                  if(i&1==0)
                                    CircleAvatar(
                                      radius: 4,
                                      backgroundColor: AppColors.active,
                                    ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: AppSizes.paddingBody),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Soton Ahmed",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(fontWeight:(i & 1) == 0 ? null: FontWeight.bold, fontSize: AppSizes.fontSizeLarge),
                                    ),
                                    Text(
                                      "  11:12 AM",
                                      style: TextStyle(fontWeight:(i & 1) == 0 ? null: FontWeight.bold, fontSize: AppSizes.fontSizeSmall, color: AppColors.subtitle),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2,),
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing",
                                  style: TextStyle(
                                    fontWeight: (i & 1) == 0 ? null: FontWeight.bold,
                                    fontSize: AppSizes.fontSizeSmall,
                                    color: AppColors.subtitle
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              //end for chat list
            ],
          ),
        ),
      ],
    );
  }
}
