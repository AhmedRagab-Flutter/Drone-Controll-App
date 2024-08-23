import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawkeyeapp/controller/auth/login_screen_controller.dart';
import 'package:hawkeyeapp/core/constants/app_colors.dart';
import 'package:hawkeyeapp/core/constants/app_textstyles.dart';
import 'package:hawkeyeapp/view/widgets/auth/auth_button.dart';
import 'package:hawkeyeapp/view/widgets/auth/auth_textform.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            Center(
              child: Image.asset(
                "assets/images/logo2.png",
              ),
            ),
            Text(
              "Login",
              style: AppTextStyles.heading1,
            ),
            Text(
              "Please Sign in to Continue",
              style: AppTextStyles.heading2,
            ),
            const Spacer(flex: 1),
            GetBuilder<LoginController>(
              builder: (controller) => AuthTextForm(
                hintText: "email",
                icon: Icons.email_outlined,
                mycontroller: controller.email,
              ),
            ),
            GetBuilder<LoginController>(
              builder: (controller) => AuthTextForm(
                obscureText: true,
                hintText: "password",
                icon: Icons.lock_outline,
                mycontroller: controller.password,
              ),
            ),
            const Spacer(flex: 1),
            Center(
              child: GetBuilder<LoginController>(builder: (controller) {
                return AuthButton(
                  text: "Login",
                  onPressed: () {
                    controller.goToHomeScreen(
                        controller.email.text, controller.password.text);
                  },
                );
              }),
            ),
            const Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an Account ? ",
                  style: AppTextStyles.heading2.copyWith(fontSize: 15),
                ),
                InkWell(
                  onTap: () {
                    controller.goToSignUpScreen();
                  },
                  child: Text(
                    "Sign Up",
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
    );
  }
}
