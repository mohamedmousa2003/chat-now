import 'package:chat_now/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../../../core/component/app_scaffold.dart';
import '../../../../core/component/material_button_widget.dart';
import '../../../../core/component/text_form_widget.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/validators/app_validators.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(createAccount,style: AppTextStyle.size23,),
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

              /// text form field Name
              CustomTextField(
                hint: firstName,
                controller: nameController,
                onValidate: (value) => AppValidators.name(value),
                onTap: () {},
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 15,),

              /// text form field Email
              CustomTextField(
                onTap: () {},
                hint: email,
                controller: emailController,
                onValidate: (value) => AppValidators.email(value),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15,),

              /// text form field Password
              CustomTextField(
                onTap: () {},
                hint: password,
                controller: passwordController,
                isPassword: true,
                onValidate: (value) => AppValidators.password(value),
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 30,),

              /// Click Login
              MaterialButtonWidget(
                title: register,
                onPressed: (){
                  if (formKey.currentState!.validate()) {

                  }
                },
              ),
              SizedBox(height: 15,),

            ],
          ),
        ),
      ),
    );
  }
}
