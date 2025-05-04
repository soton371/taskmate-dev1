import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_icons.dart';
import 'package:taskmate/core/constants/app_sizes.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';

class AddPeople extends StatelessWidget {
  const AddPeople({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add people"),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.clear)),
        actions: [
          TextButton(onPressed: (){}, child: Text("Add",style: TextStyle(fontWeight: FontWeight.bold),))
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.2))
            ),
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
            child: Row(
              children: [
                Icon(AppIcons.search),
                SizedBox(width: AppSizes.paddingBody,),
                Expanded(
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: 'Ex. Soton Ahmed',
                      border: InputBorder.none
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizes.paddingBody,),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal:AppSizes.paddingInside, vertical: 4),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: AppColors.subtitle),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      child: Image.asset(
                        AppImages.user,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text("Soton Ahmed"),
                    SizedBox(width: 8,),
                    Icon(Icons.clear, color: Colors.grey,)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal:AppSizes.paddingInside, vertical: 4),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: AppColors.subtitle),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      child: Image.asset(
                        AppImages.user,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text("Soton Ahmed"),
                    SizedBox(width: 8,),
                    Icon(Icons.clear, color: Colors.grey,)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal:AppSizes.paddingInside, vertical: 4),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: AppColors.subtitle),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      child: Image.asset(
                        AppImages.user,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text("Soton Ahmed"),
                    SizedBox(width: 8,),
                    Icon(Icons.clear, color: Colors.grey,)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.paddingBody,),
          Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(AppSizes.paddingBody),
                itemCount: 10,
                  itemBuilder: (_,i)=> Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            child: Image.asset(
                              AppImages.user,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: AppColors.active,
                          ),
                        ],
                      ),
                      SizedBox(width: AppSizes.paddingBody,),
                      Expanded(child: Text("Soton Ahmed", style: TextStyle(fontSize: AppSizes.fontSizeLarge),maxLines: 1, overflow: TextOverflow.ellipsis,),
                      ),
                      SizedBox(width: AppSizes.paddingBody,),
                      Checkbox.adaptive(value: false, onChanged: (v){})
                    ],
                  )
              )
          )
        ],
      ),
    );
  }
}
