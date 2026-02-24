import 'package:chat_now/core/utils/app_text_style.dart';
import 'package:chat_now/di/di.dart';
import 'package:chat_now/features/register/presentation/view_model/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/route_manager/routes.dart';
import '../../../../core/component/app_dailog.dart';
import '../../../../core/component/app_scaffold.dart';
import '../../../../core/component/material_button_widget.dart';
import '../../../../core/component/text_form_widget.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/validators/app_validators.dart';
import '../../domain/entities/register_entity.dart';
import '../view_model/register_cubit.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final nameController = TextEditingController(text: "Mohamed");
  final emailController = TextEditingController(text: "mo@gmail.com");
  final passwordController = TextEditingController(text: "123456789");
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: AppScaffold(
        appBar: AppBar(
          title: Text(createAccount, style: AppTextStyle.size23),
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
              children: [
                CustomTextField(
                  hint: firstName,
                  controller: nameController,
                  onValidate: (value) => AppValidators.name(value),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 15),
                CustomTextField(
                  hint: email,
                  controller: emailController,
                  onValidate: (value) => AppValidators.email(value),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 15),
                CustomTextField(
                  hint: password,
                  controller: passwordController,
                  isPassword: true,
                  onValidate: (value) => AppValidators.password(value),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 30),

                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterError) {
                      AppDialog.showMessage(context: context, message: state.error);
                    } else if (state is RegisterLoaded) {
                      AppDialog.showLoading(context: context);
                      AppDialog.showSnackBar(context, createAccountSuccess);
                      Navigator.pushReplacementNamed(context, Routes.homeRoute);
                    }
                  },
                  builder: (context, state) {
                    return MaterialButtonWidget(
                      title: register,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<RegisterCubit>().createAccount(
                            RegisterEntity(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
