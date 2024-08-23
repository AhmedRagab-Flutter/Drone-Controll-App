import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawkeyeapp/core/constants/app_colors.dart';
import 'package:hawkeyeapp/core/constants/app_textstyles.dart';

class AuthTextForm extends StatelessWidget {
  final String hintText;
  final TextEditingController mycontroller;
  final bool? obscureText;
  final IconData icon;
  final TextInputType? keyboardType;
  const AuthTextForm(
      {super.key,
      required this.hintText,
      required this.mycontroller,
      this.obscureText,
      required this.icon,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      height: Get.height * 0.07,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        style: AppTextStyles.bodyText1,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          suffixIcon: Icon(
            icon,
            color: AppColors.primary,
          ),
          hintText: hintText,
          hintStyle: AppTextStyles.bodyText1.copyWith(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
