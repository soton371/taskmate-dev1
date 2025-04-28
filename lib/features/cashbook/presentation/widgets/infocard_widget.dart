// lib/features/cashbook/widgets/info_card_widget.dart
import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_sizes.dart';

class InfoCardWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final int totalItems;

  const InfoCardWidget({
    super.key,
    required this.title,
    required this.children,
    required this.totalItems,
  });

  @override
  Widget build(BuildContext context) {
    final showDots = children.length < totalItems;

    return Container(
      padding: EdgeInsets.all(AppSizes.paddingInside / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(10, 0, 0, 0),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: AppSizes.fontSizeLarge,
              color: Colors.black54,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: AppSizes.paddingInside),
          Wrap(
            spacing: AppSizes.paddingInside,
            runSpacing: AppSizes.paddingInside,
            children: [
              ...children,
              if (showDots)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingInside / 2),
                  child: Text(
                    "...",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.fontSizeLarge,
                      color: Colors.black38,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
