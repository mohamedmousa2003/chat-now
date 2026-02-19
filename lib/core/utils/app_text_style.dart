import 'package:flutter/material.dart';
import 'app_color.dart';

abstract class AppTextStyle {

  static TextStyle size26 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold, // medium
    color: black,
  );

  static TextStyle size24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold, // medium
    color: black,
  );

  static TextStyle size23 = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.bold, // medium
    color: white,
  );

  static TextStyle size21 = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w500, // medium
    color: black,
  );

  static TextStyle size20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500, // medium
    color: black,
  );

  static TextStyle size18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500, // medium
    color: black,
  );

  static TextStyle size16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, // medium
    color: black,
  );

  static TextStyle size14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500, // medium
    color: black,
  );

  //? get lang
  // static var lang = SharedPreferencesUtils.getData(key: AppKeysSharedPref.lang);
  // static String? _fontFamily() {
  //   return lang == 'en'
  //       ? FontFamilyHelper.mantserratEnglish
  //       : FontFamilyHelper.tajawalArabic;
  // }
}