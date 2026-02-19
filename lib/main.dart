import 'package:flutter/material.dart';
import 'config/route_manager/route_generator.dart';
import 'config/route_manager/routes.dart';
import 'features/login/presentation/pages/login_view.dart';
import 'features/register/presentation/pages/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.splashRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
