import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/app_input_widgets.dart';
import '../widgets/auth_card.dart';
import 'otp_verification_page.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Account")),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(AppSizes.paddingBody),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AuthCard(imgPath: AppImages.login,),
                SizedBox(height: AppSizes.height(context, 50)),
                AppTextField(
                  labelText: 'Your full name',
                  hintText: 'Ex. Soton Ahmed',
                  controller: TextEditingController(),
                ),
                SizedBox(height: AppSizes.paddingBody),
                AppTextField(
                  labelText: 'Your email address',
                  hintText: 'Ex. soton.m360ict@gmail.com',
                  controller: TextEditingController(),
                ),
                SizedBox(height: AppSizes.paddingBody),
                AppTextField(
                  labelText: 'Your password',
                  hintText: '**************',
                  controller: TextEditingController(),
                  suffixIcon: Icon(HugeIcons.strokeRoundedViewOff),
                ),

                SizedBox(height: AppSizes.height(context, 50)),
                FilledButton(onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (_)=> OtpVerificationPage()));
                }, child: Text("Next")),
              ],
            ),),

          Divider(thickness: 0.5,),
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Row(
            children: [
              Text("!",style: TextStyle(fontWeight: FontWeight.bold),),
              Text("  Already have an account"),
            ],
          )),
        ],
      ),
    );
  }
}
