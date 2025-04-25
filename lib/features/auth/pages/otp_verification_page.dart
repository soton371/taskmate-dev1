import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/features/auth/pages/reset_password_page.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_sizes.dart';
import '../widgets/auth_card.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OTP Verification")),
      body: ListView(
        padding: EdgeInsets.all(AppSizes.paddingBody),
        children: [
          AuthCard(imgPath: AppImages.passwordAccess,),
          SizedBox(height: AppSizes.paddingBody),
          Text("We sent your code to soton.m360ict@gmail.com", style: TextStyle(color: AppColors.subtitle, fontSize: AppSizes.fontSizeSmall),),
          Text("This code will expire in 00:30", style: TextStyle(color: AppColors.subtitle, fontSize: AppSizes.fontSizeSmall),),
          SizedBox(height: AppSizes.height(context, 50)),
          Pinput(
            length: 6,
            onCompleted: (pin) {
            },
          ),
          SizedBox(height: AppSizes.height(context, 80)),
          FilledButton(onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (_)=> ResetPasswordPage()));
          }, child: Text("Next")),
        ],
      ),
    );
  }
}
