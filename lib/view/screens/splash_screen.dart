import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawkeyeapp/controller/splash_screen_controller.dart';
import 'package:hawkeyeapp/core/constants/app_colors.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image.asset(
          "assets/images/logo2.png",
        ),
      ),
    );
  }
}
