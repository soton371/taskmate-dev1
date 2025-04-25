import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:taskmate/features/auth/pages/sign_in_page.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';


class PasswordUpdatePage extends StatelessWidget {
  const PasswordUpdatePage({super.key,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.paddingBody),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Password Update",style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizes.fontSizeMaxLarge),),
              SizedBox(height: AppSizes.height(context, 30),),
              Container(
                padding: EdgeInsets.all(AppSizes.paddingBody),
                decoration: BoxDecoration(
                    color: AppColors.seed.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Icon(HugeIcons.strokeRoundedTick02, color:AppColors.seed,size: 60,),
              ),
              SizedBox(height: AppSizes.height(context, 30),),
              Text("your password has been updated!",),
              SizedBox(height: AppSizes.height(context, 80),),
              FilledButton(onPressed: (){
                Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=>SignInPage()), (p)=>false);
              }, child: Text('Sign In'))
            ],
          ),
        ),
      ),
    );
  }
}
