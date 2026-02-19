import 'package:chat_now/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(noRoom,style: AppTextStyle.size20.copyWith(fontWeight: FontWeight.bold),));
  }
}
