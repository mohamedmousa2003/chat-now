import 'package:chat_now/core/utils/app_color.dart';
import 'package:chat_now/core/utils/images.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

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
