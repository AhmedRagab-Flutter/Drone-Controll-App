import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawkeyeapp/core/constants/app_colors.dart';
import 'package:hawkeyeapp/core/constants/app_textstyles.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: Get.width * 0.5,
      height: Get.height * 0.07,
      color: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(text,
          style: AppTextStyles.heading2.copyWith(color: AppColors.background)),
    );
  }
}
