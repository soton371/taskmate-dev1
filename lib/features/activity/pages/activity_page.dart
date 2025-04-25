import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_icons.dart';
import 'package:taskmate/core/constants/app_sizes.dart';

import '../../../core/constants/app_values.dart';
import '../../../core/utilities/app_string_modify.dart';
import '../../home/widgets/recent_card.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSizes.paddingBody),
            decoration: BoxDecoration(
                color: AppColors.cardBG,
              border: Border(bottom: BorderSide(color: AppColors.border, width: 0.5))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shamol Kumar assigned to you",style: TextStyle(color: AppColors.subtitle),),
                    Text("Apr 7",style: TextStyle(color: AppColors.subtitle, fontSize: AppSizes.fontSizeExtraSmall)),
                  ],
                ),
                RecentCard(
                  forActivity: true,
                  onTap: (){
                    // Navigator.push(context, CupertinoPageRoute(builder: (_)=>SessionPage()));
                  },
                  color: AppColors.randomColor(),
                  title:
                  capitalizeFirstLetter("CategoryType.session.name") ?? '',
                  subTitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                  iconData: AppIcons.findIcon(CategoryType.session),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppSizes.paddingBody),
            decoration: BoxDecoration(
                // color: AppColors.cardBG,
                border: Border(bottom: BorderSide(color: AppColors.border, width: 0.5))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("You assigned to Zayed Oyshik",style: TextStyle(color: AppColors.subtitle),),
                    Text("Apr 17",style: TextStyle(color: AppColors.subtitle, fontSize: AppSizes.fontSizeExtraSmall)),
                  ],
                ),
                RecentCard(
                  forActivity: true,
                  onTap: (){
                    // Navigator.push(context, CupertinoPageRoute(builder: (_)=>CommunicationPage()));
                  },
                  color: AppColors.randomColor(),
                  title:
                  capitalizeFirstLetter("CategoryType.communication.name") ?? '',
                  subTitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                  iconData: AppIcons.findIcon(CategoryType.communication),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppSizes.paddingBody),
            decoration: BoxDecoration(
              // color: AppColors.cardBG,
                border: Border(bottom: BorderSide(color: AppColors.border, width: 0.5))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shamol Kumar assigned to you",style: TextStyle(color: AppColors.subtitle),),
                    Text("Apr 7",style: TextStyle(color: AppColors.subtitle, fontSize: AppSizes.fontSizeExtraSmall)),
                  ],
                ),
                RecentCard(
                  forActivity: true,
                  onTap: (){
                    // Navigator.push(context, CupertinoPageRoute(builder: (_)=>SessionPage()));
                  },
                  color: AppColors.randomColor(),
                  title:
                  capitalizeFirstLetter("CategoryType.session.name") ?? '',
                  subTitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                  iconData: AppIcons.findIcon(CategoryType.session),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppSizes.paddingBody),
            decoration: BoxDecoration(
              // color: AppColors.cardBG,
              //   border: Border(bottom: BorderSide(color: AppColors.border, width: 0.5))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("You assigned to Zayed Oyshik",style: TextStyle(color: AppColors.subtitle),),
                    Text("Apr 17",style: TextStyle(color: AppColors.subtitle, fontSize: AppSizes.fontSizeExtraSmall)),
                  ],
                ),
                RecentCard(
                  forActivity: true,
                  onTap: (){
                    // Navigator.push(context, CupertinoPageRoute(builder: (_)=>CommunicationPage()));
                  },
                  color: AppColors.randomColor(),
                  title:
                  capitalizeFirstLetter("CategoryType.communication.name") ?? '',
                  subTitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                  iconData: AppIcons.findIcon(CategoryType.communication),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
