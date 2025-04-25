import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:taskmate/core/constants/app_images.dart';
import 'package:taskmate/core/constants/app_sizes.dart';
import 'package:taskmate/core/widgets/app_input_widgets.dart';
import 'package:taskmate/features/auth/pages/sign_in_page.dart';

import '../../../core/constants/app_colors.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        // padding: EdgeInsets.all(AppSizes.paddingBody),
        decoration: BoxDecoration(
          gradient: AppColors.gradient()
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSizes.height(context, 60)),
            Padding(padding: EdgeInsets.all(AppSizes.paddingBody),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Picture this; a\nmessaging app,",
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeMaxLarge,
                    color: AppColors.scaffoldBg,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "but built for\nwork",
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeMaxLarge,
                    color: AppColors.onboardGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),),

            SizedBox(height: AppSizes.height(context, 50),),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(AppSizes.paddingBody),
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBg,
                  borderRadius: BorderRadius.vertical(top: Radius.elliptical(200, 40))
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppSizes.paddingBody * 2),
                      child: Image.asset(AppImages.onboard),
                    ),

                    Spacer(),

                    FilledButton(
                      onPressed: () {
                        appBottomSheet(
                          context,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FilledButton(
                                onPressed: () async{
                                  List<String> scopes = <String>[
                                    'email',
                                    'https://www.googleapis.com/auth/contacts.readonly',
                                  ];

                                  GoogleSignIn googleSignIn = GoogleSignIn(
                                    // Optional clientId
                                    // clientId: 'your-client_id.apps.googleusercontent.com',
                                    scopes: scopes,
                                  );

                                  try {
                                    await googleSignIn.signIn();
                                  } catch (error) {
                                    if (kDebugMode) {
                                      print(error);
                                    }
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(HugeIcons.strokeRoundedGoogle),
                                    SizedBox(width: AppSizes.paddingInside),
                                    Text("Continue with Google"),
                                  ],
                                ),
                              ),
                              SizedBox(height: AppSizes.paddingBody),
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_)=> SignInPage()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(HugeIcons.strokeRoundedMail01),
                                    SizedBox(width: AppSizes.paddingInside),
                                    Text("Continue with Email"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        "Get Started",
                      ),
                    ),

                    SizedBox(height: AppSizes.height(context, 60)),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
