import 'package:chat/features/auth/domain/entities/register_entity.dart';
import 'package:chat/features/auth/domain/use_cases/register_usecase.dart';
import 'package:chat/features/auth/presentation/manager/cubit/register_cubit.dart';
import 'package:chat/features/auth/presentation/manager/state/register_state.dart';
import 'package:chat/features/auth/presentation/pages/login_view.dart';
import 'package:chat/features/auth/presentation/widgets/auth_button.dart';
import 'package:chat/features/auth/presentation/widgets/auth_footer_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/images_assets.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/components/main_text_form_field.dart';
import '../../data/data_sources/auth_firebase_datasource_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';

class RegisterView extends StatelessWidget {
  static const String routeName = "Register";
  RegisterView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(
        registerUseCase: RegisterUseCase(
          AuthRepositoryImpl(
            AuthFirebaseDataSourceImpl(FirebaseAuth.instance),
          ),
        ),
      ),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is RegisterLoaded) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Register successful')),
            );
            // Navigate to Login screen after successful registration
            Navigator.pushReplacementNamed(context, LoginView.routeName);
          } else if (state is RegisterError) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Stack(
          children: [
            Image.asset(
              ImagePng.backgroundImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
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
                        TextFormFieldWidget(
                          title: email,
                          controller: emailController,
                          hintText: enterYourEmail,
                          keyboardType: TextInputType.emailAddress,
                          myValidator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$")
                                .hasMatch(value)) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
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
                        BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                            return AuthButton(
                              text: register,
                              emailController: emailController,
                              passwordController: passwordController,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  final entity = RegisterEntity(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  context.read<RegisterCubit>().register(entity);
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(height: 40.h),
                        AuthFooterText(
                          text: noHaveAccount,
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, LoginView.routeName);
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
        ),
      ),
    );
  }
}
