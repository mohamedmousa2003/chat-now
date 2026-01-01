import 'package:chat/core/utils/app_colors.dart';
import 'package:chat/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final double fontSize;

  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.emailController,
    required this.passwordController,
    this.fontSize = 18,
  });

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
    widget.emailController.addListener(_updateButton);
    widget.passwordController.addListener(_updateButton);
  }

  void _updateButton() {
    final enabled = widget.emailController.text.isNotEmpty &&
        widget.passwordController.text.isNotEmpty;
    if (enabled != isEnabled) {
      setState(() {
        isEnabled = enabled;
      });
    }
  }

  @override
  void dispose() {
    widget.emailController.removeListener(_updateButton);
    widget.passwordController.removeListener(_updateButton);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? widget.onPressed : null,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        backgroundColor: isEnabled ? AppColor.blue : AppColor.gray,
        elevation: 4,
        shadowColor: Colors.black26,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.text,
              style: AppTextStyle.size18.copyWith(
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Icon(Icons.arrow_forward, color: AppColor.white, size: 25),
        ],
      ),
    );
  }
}
