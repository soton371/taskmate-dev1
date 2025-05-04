import 'package:flutter/material.dart';

class AppSizes{
  static const double paddingBody = 16;
  static const double paddingInside = 10;

  static const double fontSizeExtraSmall = 10;
  static const double fontSizeSmall = 12;
  static const double fontSizeDefault = 14;
  static const double fontSizeLarge = 16;
  static const double fontSizeExtraLarge = 18;
  static const double fontSizeOverLarge = 24;
  static const double fontSizeMaxLarge = 30;


  static const double cardRadius = 10;

  static const double textFieldRadius = 6;

  static const double buttonRadius = 10;
  static const double buttonHeight = 50;
  static const double buttonText = 15;

  static double height(context, double value)=>MediaQuery.sizeOf(context).height * (value/900);
  static double width(context, double value)=>MediaQuery.sizeOf(context).width * (value/300);
}

