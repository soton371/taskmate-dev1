import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:taskmate/features/auth/pages/password_update_page.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/app_input_widgets.dart';
import '../widgets/auth_card.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: ListView(
        padding: EdgeInsets.all(AppSizes.paddingBody),
        children: [
          AuthCard(imgPath: AppImages.security,),
          SizedBox(height: AppSizes.paddingBody,),
          Text("New Credentials", style: TextStyle(fontSize: AppSizes.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
          Text("Your identity has been verified! Set your new password", style: TextStyle(color: AppColors.subtitle, fontSize: AppSizes.fontSizeSmall),),
          SizedBox(height: AppSizes.height(context, 50)),
          AppTextField(
            labelText: 'New password',
            hintText: '**************',
            controller: TextEditingController(),
            suffixIcon: Icon(HugeIcons.strokeRoundedViewOff),
          ),
          SizedBox(height: AppSizes.paddingBody),
          AppTextField(
            labelText: 'Confirm password',
            hintText: '**************',
            controller: TextEditingController(),
            suffixIcon: Icon(HugeIcons.strokeRoundedViewOff),
          ),
          SizedBox(height: AppSizes.height(context, 80)),
          FilledButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=>PasswordUpdatePage()), (_)=>false);
          }, child: Text("Update")),
        ],
      ),
    );
  }
}
