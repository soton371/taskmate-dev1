import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_icons.dart';
import 'package:taskmate/core/constants/app_sizes.dart';
import 'package:taskmate/features/direct_message/page/add_people.dart';


class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create group"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_)=> AddPeople()));
          }, child: Text("Next"))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSizes.paddingBody),
        children: [
          Text("Group Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizes.fontSizeLarge),),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Ex. Chrome",
                  ),
                ),
              ),
              SizedBox(width: AppSizes.paddingBody,),
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.group, size: 40,color: Colors.grey,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.black12, // Adjust opacity as needed
                      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                    ),
                  ),
                  Icon(Icons.camera_alt_outlined,color: Colors.white,)
                ],
              ),
            ],
          ),
          SizedBox(height: AppSizes.paddingBody,),
          Container(
            padding: EdgeInsets.all(AppSizes.paddingInside),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.cardRadius),
              color: AppColors.randomPastelColor().withValues(alpha: 0.1)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(AppIcons.session),
                SizedBox(width: AppSizes.paddingInside,),
                Expanded(child: Text("Groups are where conversations happen around a topic. Use a name that's easy to find and understand.")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
