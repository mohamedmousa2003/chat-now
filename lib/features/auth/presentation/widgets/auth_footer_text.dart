import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
class AuthFooterText extends StatelessWidget {
  final String text;
  final String clickableText;
  final VoidCallback onTap;

  const AuthFooterText({
    super.key,
    required this.text,
    required this.clickableText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyle.size14,
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: onTap,
          child: Text(
            clickableText,
            style: AppTextStyle.size14.copyWith(
              color: AppColor.blue,
            ),
          ),
        ),
      ],
    );
  }
}
