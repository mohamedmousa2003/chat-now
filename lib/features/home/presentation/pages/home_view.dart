import 'package:chat_now/core/component/empty_state_widget.dart';
import 'package:chat_now/core/utils/app_color.dart';
import 'package:chat_now/core/utils/app_text_style.dart';
import 'package:chat_now/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/component/app_scaffold.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(chatApp,style: AppTextStyle.size26.copyWith(color: white),),
        actions: [
         IconButton(
             onPressed: (){},
             icon: Icon(CupertinoIcons.search,color: white,size: 35,)
         ),
        ],
        elevation: 0,
        backgroundColor: transparent,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyStateWidget()
        ],
      ),
      floatingActionButton:FloatingActionButton.small(onPressed: () {

      },),
    );
  }
}
