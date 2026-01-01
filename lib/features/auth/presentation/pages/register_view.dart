import 'dart:math';

import 'package:chat/features/auth/presentation/pages/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/images_assets.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/components/main_text_form_field.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_footer_text.dart';
class RegisterView extends StatelessWidget {
  static const String routeName="Register";
  RegisterView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //? background
        Image.asset(
          ImagePng.backgroundImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),

        // Scaffold
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(createAccount),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),

          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 40.h),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 80.h),

                    //? FirstName
                    TextFormFieldWidget(
                      title: firstName,
                      controller: firstNameController,
                      hintText: enterYourFirstName,
                      keyboardType: TextInputType.name,
                      myValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter first name";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20.h),

                    //? Last Name
                    TextFormFieldWidget(
                      title: lastName,
                      controller: lastNameController,
                      hintText: enterYourLastName,
                      keyboardType: TextInputType.name,
                      myValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter last name";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20.h),

                    //? Email
                    TextFormFieldWidget(
                      title: email,
                      controller: emailController,
                      hintText: enterYourEmail,
                      keyboardType: TextInputType.emailAddress,
                      myValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$")
                            .hasMatch(value)) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },

                    ),

                    SizedBox(height: 20.h),

                    // password
                    TextFormFieldWidget(
                      title: password,
                      controller: passwordController,
                      hintText: "******",
                      isPassword: true,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      myValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 25.h),

                    //? login
                    AuthButton(
                      text: register,
                      emailController: emailController,
                      passwordController: passwordController,
                      onPressed: (){
                        if (formKey.currentState!.validate()) {}
                      },

                    ),


                    SizedBox(height: 40.h),

                    //? Login
                    AuthFooterText(
                      text: noHaveAccount,
                      onTap: (){
                        Navigator.pushReplacementNamed(context, LoginView.routeName);
                      },
                      clickableText: login,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
