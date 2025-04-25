import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const Color scaffoldBg = Colors.white;
  static const Color seed = Color(0xff5f33e1);
  static const Color black = Colors.black;
  static Color fill = seed.withValues(alpha: 0.07);
  static const Color subtitle = Color(0xff716E80);
  static Color border = Colors.grey.shade400;
  static Color lightGrey = Colors.grey.shade200;
  static const Color active = Color(0xff00C853);
  static Color selected = Colors.deepPurple.shade900;
  static Color cardBG = Colors.lightBlue.shade50;

  static const Color onboardGreen = Color(0xffC6FF00);

  static List<BoxShadow> boxShadow = [BoxShadow(color: const Color.fromARGB(15, 0, 0, 0), blurRadius: 10, offset: Offset(0, 2))];

  static LinearGradient gradient(
      {AlignmentGeometry? begin, AlignmentGeometry? end}) => LinearGradient(
    colors: [Color(0xff5f33e1), Color(0xff1488cc)],
    stops: [0, 1],
    begin: begin ?? Alignment.topLeft,
    end: end ?? Alignment.bottomRight,
  );


  static Color randomPastelColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      (random.nextInt(128) + 127),
      (random.nextInt(128) + 127),
      (random.nextInt(128) + 127),
    );
  }

  static Color randomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      (random.nextInt(225)),
      (random.nextInt(225)),
      (random.nextInt(225)),
    );
  }
}
