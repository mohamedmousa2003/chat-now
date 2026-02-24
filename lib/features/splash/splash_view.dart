import 'package:chat_now/config/route_manager/routes.dart';
import 'package:chat_now/core/utils/app_color.dart';
import 'package:chat_now/core/utils/images.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: white,
      body: Center(
        child: Image.asset(AppImages.logo,width: 200,height: 200,fit: BoxFit.cover,),
      ),
    );
  }
}
