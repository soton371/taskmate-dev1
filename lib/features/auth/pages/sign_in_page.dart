import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_images.dart';
import 'package:taskmate/core/constants/app_sizes.dart';

import '../../../core/widgets/app_input_widgets.dart';
import '../../root/page/root_page.dart';
import '../widgets/auth_card.dart';
import 'create_account_page.dart';
import 'otp_verification_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(AppSizes.paddingBody),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthCard(imgPath: AppImages.login,),
              SizedBox(height: AppSizes.height(context, 50)),
              AppTextField(
                labelText: 'Your email address',
                hintText: 'ex. soton.m360ict@gmail.com',
                controller: TextEditingController(),
              ),
              SizedBox(height: AppSizes.paddingBody),
              AppTextField(
                labelText: 'Your password',
                hintText: '**************',
                controller: TextEditingController(),
                suffixIcon: Icon(HugeIcons.strokeRoundedViewOff),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    appBottomSheet(context, child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Forgot Password?",style: TextStyle(fontSize: AppSizes.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                        Text("Please enter an email address to request a password reset.",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.subtitle),),
                        SizedBox(height: AppSizes.paddingBody,),

                        AppTextField(
                          labelText: 'Your email address',
                          hintText: 'ex. soton.m360ict@gmail.com',
                          controller: TextEditingController(),
                        ),
                        SizedBox(height: AppSizes.paddingBody*2,),

                        FilledButton(onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(context, CupertinoPageRoute(builder: (_)=> OtpVerificationPage()));
                        }, child: Text("Send OTP"))
                      ],
                    ));
                  },
                  child: Text("Forgot password?"),
                ),
              ),
              SizedBox(height: AppSizes.height(context, 50)),
              FilledButton(onPressed: () {
                Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=> RootPage()), (p)=> false);
              }, child: Text("Sign In")),
            ],
          ),),

          Divider(thickness: 0.5,),
          TextButton(onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (_)=> CreateAccountPage()));
          }, child: Row(
            children: [
              Text("!",style: TextStyle(fontWeight: FontWeight.bold),),
              Text("  Create account"),
            ],
          )),
        ],
      ),
    );
  }
}
