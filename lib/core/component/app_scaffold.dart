import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/images.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final bool showBackground;
  const AppScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.appBar,
    this.showBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: white),
        Image.asset(
          AppImages.background,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Scaffold(
          appBar: appBar,
          backgroundColor: transparent,
          body: SafeArea(child: body),
          floatingActionButton: floatingActionButton,
        ),
      ],
    );
  }
}
