import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hawkeyeapp/core/constants/app_colors.dart';

class Info extends StatelessWidget {
  final String text;
  const Info({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Get.height * 0.03),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 8,
            color: AppColors.primary,
          ),
          SizedBox(width: Get.width * 0.05),
          Center(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
