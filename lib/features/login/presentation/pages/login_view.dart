import 'package:flutter/material.dart';
import '../../../../core/component/app_scaffold.dart';
import '../../../../core/component/material_button_widget.dart';
import '../../../../core/component/text_form_widget.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/validators/app_validators.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final emailController = TextEditingController(text: "mohamedmousa2003@gmail.com",);
  final passwordController = TextEditingController(text: "mousa123456789");
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(login,style: AppTextStyle.size23,),
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
              SizedBox(height: 30,),
              Text(welcome,style: AppTextStyle.size26,),
              SizedBox(height: 30,),
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
                title: login,
                onPressed: (){},
              ),
              SizedBox(height: 15,),

              ////// Click Create my account
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {

                  }
                },
                child: Center(child: Text(createMyAccount,style: AppTextStyle.size18.copyWith(color: blue,fontWeight: FontWeight.bold),)),
              )

            ],
          ),
        ),
      ),
    );
  }
}
