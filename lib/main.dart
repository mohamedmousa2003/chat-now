import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/pages/login_view.dart';
import 'features/auth/presentation/pages/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Chat',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: LoginView.routeName,
          routes: {
            LoginView.routeName: (context) =>  LoginView(),
            RegisterView.routeName: (context) =>  RegisterView(),
          },
        );
      },
    );
  }
}
