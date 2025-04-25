import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class AuthCard extends StatelessWidget {
  const AuthCard({super.key, required this.imgPath});
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(AppSizes.paddingBody),
      decoration: BoxDecoration(
        gradient: AppColors.gradient(),
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      ),
      child: Image.asset(imgPath, height: 80),
    );
  }
}
