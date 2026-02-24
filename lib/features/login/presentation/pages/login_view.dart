import 'package:chat_now/config/route_manager/routes.dart';
import 'package:chat_now/di/di.dart';
import 'package:chat_now/features/login/presentation/view_model/login_cubit.dart';
import 'package:chat_now/features/login/presentation/view_model/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/component/app_dailog.dart';
import '../../../../core/component/app_scaffold.dart';
import '../../../../core/component/material_button_widget.dart';
import '../../../../core/component/text_form_widget.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/validators/app_validators.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final emailController = TextEditingController(
    text: "mo@gmail.com",
  );
  final passwordController = TextEditingController(text: "123456789");
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: AppScaffold(
        appBar: AppBar(
          title: Text(login, style: AppTextStyle.size23),
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          backgroundColor: transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(welcome, style: AppTextStyle.size26),
                SizedBox(height: 30),

                /// text form field Email
                CustomTextField(
                  hint: email,
                  controller: emailController,
                  onValidate: (value) => AppValidators.email(value),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 15),

                /// text form field Password
                CustomTextField(
                  hint: password,
                  controller: passwordController,
                  isPassword: true,
                  onValidate: (value) => AppValidators.password(value),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 30),

                /// Click Login
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginError) {
                      AppDialog.showMessage(
                        context: context,
                        message: state.error,
                      );
                    } else if (state is LoginLoaded) {
                      AppDialog.showLoading(context: context);
                      AppDialog.showSnackBar(context, loginSuccess);
                      Navigator.pushReplacementNamed(context, Routes.homeRoute);
                    }
                  },
                  builder: (context, state) {
                    return MaterialButtonWidget(
                      title: login,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 15),

                ////// Click Create my account
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.registerRoute);
                  },
                  child: Center(
                    child: Text(
                      createMyAccount,
                      style: AppTextStyle.size18.copyWith(
                        color: blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
