import 'package:chat/core/utils/app_colors.dart';
import 'package:chat/features/auth/presentation/pages/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/images_assets.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "Home";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Stack(
      children: [
        Image.asset(
          ImagePng.backgroundImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Drawer Header

                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        user!.email ??" ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),

                    ],
                  ),
                ),

                // Drawer Items
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                const Divider(),

                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RegisterView.routeName);
                    // logout logic
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.search,color: AppColor.white,size: 30,)),
            ],
            title: Text("Chat App"),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
        ),
      ],
    );
  }
}
