import 'package:chat/features/auth/domain/entities/login_entity.dart';
import 'package:chat/features/auth/domain/use_cases/login_usecase.dart';
import 'package:chat/features/auth/presentation/manager/cubit/login_cubit.dart';
import 'package:chat/features/auth/presentation/manager/state/login_state.dart';
import 'package:chat/features/auth/presentation/pages/register_view.dart';
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
import '../../../home/presentation/pages/home_view.dart';
import '../../data/data_sources/auth_firebase_datasource_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';

class LoginView extends StatelessWidget {
  static const String routeName = "Login";
  LoginView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(text: "mousa@gmail.com");
  final TextEditingController passwordController = TextEditingController(text: "123456789");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
          loginUseCase:LoginUseCase(
              AuthRepositoryImpl(
                  AuthFirebaseDataSourceImpl(
                      FirebaseAuth.instance
                  ),
              )
          ),
      ),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoadingLogin) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is LoadedLogin) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successful')),
            );
            Navigator.pushReplacementNamed(context,HomeView.routeName );
          } else if (state is ErrorLogin) {
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
              appBar: AppBar(
                title: Text(login),
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
                        SizedBox(height: 50.h),
                        Text(
                          welcomeLoginBack,
                          style: AppTextStyle.size22,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 50.h),
                        // Email
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
                        // Password
                        TextFormFieldWidget(
                          title: password,
                          controller: passwordController,
                          hintText: "******",
                          isPassword: true,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          myValidator: (value) {
                            if (value == null || value.isEmpty || value.trim() == "") {
                              return "Please enter your password";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              forgotPassword,
                              style: AppTextStyle.size14,
                            ),
                          ),
                        ),
                        SizedBox(height: 25.h),
                        // Login button
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            final isLoading = state is LoadingLogin;
                            return AuthButton(
                              text: login,
                              emailController: emailController,
                              passwordController: passwordController,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  final entity = LoginEntity(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  context.read<LoginCubit>().login(entity);
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(height: 40.h),
                        // Register
                        AuthFooterText(
                          text: noHaveAccount,
                          onTap: () {
                            Navigator.pushReplacementNamed(context, RegisterView.routeName);
                          },
                          clickableText: register,
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
