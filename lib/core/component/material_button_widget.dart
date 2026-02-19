import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_text_style.dart';

class MaterialButtonWidget extends StatelessWidget {
  MaterialButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.colorText,
    this.colorBackground,
    this.fontWeight,
    this.haveBorder = false,
    this.radius,
  });
  final String title;
  final void Function()? onPressed;
  final Color? colorText;
  final Color? colorBackground;
  final FontWeight? fontWeight;
  final double? radius;
  bool haveBorder = false;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 50),
        side: BorderSide(
          color: haveBorder ? blue : transparent,
          width: 2,
        ),
      ),
      onPressed: onPressed,
      color: colorBackground ?? blue,
      child: Text(
        title,
        style: AppTextStyle.size18.copyWith(
          color: colorText ?? white,
          fontWeight: fontWeight ?? FontWeight.bold,
        ),
      ),
    );
  }
}