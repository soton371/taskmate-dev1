import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:taskmate/core/constants/app_sizes.dart';

class CircularActionButton extends StatelessWidget {
  final List<Color> gradientColors;
  final IconData icon;
  final double size;
  final VoidCallback onTap;

  const CircularActionButton({
    super.key,
    required this.gradientColors,
    required this.icon,
    this.size = 24.0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(AppSizes.paddingInside),
        child: HugeIcon(
          icon: icon,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }
}
