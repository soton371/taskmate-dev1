import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class InProgressCard extends StatelessWidget {
  const InProgressCard({
    super.key,
    required this.subTitle,
    required this.title,
    required this.percent,
    required this.color,
  });

  final String subTitle, title;
  final double percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.width(context, 200),
      margin: EdgeInsets.only(
        left: AppSizes.paddingBody,
        top: AppSizes.paddingInside,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      ),
      padding: EdgeInsets.all(AppSizes.paddingInside),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subTitle,
            style: TextStyle(
              color: AppColors.subtitle,
              fontSize: AppSizes.fontSizeSmall,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AppSizes.paddingBody),
          LinearPercentIndicator(
            lineHeight: 7.0,
            percent: percent,
            backgroundColor: Colors.white,
            progressColor: color,
            animation: true,
            animationDuration: 900,
            barRadius: Radius.circular(50),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}

class InProgressView extends StatefulWidget {
  const InProgressView({super.key});

  @override
  State<InProgressView> createState() => _InProgressViewState();
}

class _InProgressViewState extends State<InProgressView> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingBody,
          ),
          child: Text(
            "In Progress",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (_,i){
              return InProgressCard(
                subTitle: "projectType",
                title: "projectName",
                percent: 0.3,
                color: AppColors.randomPastelColor(),
              );
            },
          ),
        ),
      ],
    );
  }
}
