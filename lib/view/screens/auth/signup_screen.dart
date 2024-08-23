import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawkeyeapp/controller/auth/signup_screen_controller.dart';
import 'package:hawkeyeapp/core/constants/app_colors.dart';
import 'package:hawkeyeapp/core/constants/app_textstyles.dart';
import 'package:hawkeyeapp/view/widgets/auth/auth_button.dart';
import 'package:hawkeyeapp/view/widgets/auth/auth_textform.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo2.png",
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "Create Account",
                style: AppTextStyles.heading2.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              GetBuilder<SignUpControllerImp>(
                builder: (controller) => AuthTextForm(
                  mycontroller: controller.email,
                  hintText: "Email",
                  icon: Icons.email_outlined,
                ),
              ),
              GetBuilder<SignUpControllerImp>(
                builder: (controller) => AuthTextForm(
                  obscureText: true,
                  mycontroller: controller.password,
                  hintText: "Password",
                  icon: Icons.lock_outline,
                ),
              ),
              const Spacer(),
              Center(
                child: AuthButton(
                  onPressed: () {
                    controller.createAccountAndGoToLogin();
                  },
                  text: "Sign Up",
                ),
              ),
              const Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account ? ",
                    style: AppTextStyles.heading2.copyWith(fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      controller.goToLogin();
                    },
                    child: Text(
                      "Login",
                      style: AppTextStyles.heading2.copyWith(
                        fontSize: 15,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
