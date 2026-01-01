import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/icon_assets.dart';
import '../app_colors.dart';
import '../app_text_style.dart';

typedef Validator = String? Function(String?);

class TextFormFieldWidget extends StatefulWidget {
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  bool obscureText;
  final bool isPassword;
  final TextEditingController controller;
  final Validator myValidator;
  final bool? enabled;
  final bool isPhone;
  final double horizontalPadding;
  final double verticalPadding;
  final TextStyle? textStyle;
  final Widget? prefixIcon;

  TextFormFieldWidget({
    required this.title,
    required this.controller,
    required this.myValidator,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isPassword = false,
    this.isPhone = false,
    this.horizontalPadding = 10.0,
    this.verticalPadding = 7.0,
    this.textStyle,
    this.enabled,
    this.prefixIcon,
    super.key,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding.w),
          child: Text(
            widget.title,
            style: widget.textStyle ?? AppTextStyle.size16.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColor.black,
            ),
          ),
        ),
        SizedBox(height: widget.verticalPadding.h),
        TextFormField(
          enabled: widget.enabled ?? true,
          obscureText: widget.obscureText,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          validator: widget.myValidator,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: widget.enabled == false ? AppColor.gray : AppColor.black,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.gray,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            border: outlineInputBorder(AppColor.gray, 1),
            enabledBorder: outlineInputBorder(AppColor.gray, 1),
            focusedBorder: outlineInputBorder(AppColor.primary, 2),
            errorBorder: outlineInputBorder(AppColor.red, 1),
            focusedErrorBorder: outlineInputBorder(AppColor.red, 1),
            prefixIcon: widget.isPhone
                ? const ContainerFlagWidget()
                : widget.prefixIcon,
            prefixIconColor: AppColor.gray,
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                widget.obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColor.gray,
                size: 25.sp,
              ),
              onPressed: () {
                setState(() {
                  widget.obscureText = !widget.obscureText;
                });
              },
            )
                : null,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder outlineInputBorder(Color color, double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}

class ContainerFlagWidget extends StatelessWidget {
  const ContainerFlagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.w,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Row(
          children: [
            Text(
              '+967',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.black,
              ),
            ),
            SizedBox(width: 4.w),
            Image.asset(
              IconsPng.flag,
              width: 32.w,
              height: 21.h,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
