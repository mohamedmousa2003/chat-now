import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.transparent,
    appBarTheme:AppBarTheme(
      backgroundColor: AppColor.transparent,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      titleTextStyle:  AppTextStyle.size24
    ),

  );

}
