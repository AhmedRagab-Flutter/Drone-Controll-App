import 'package:flutter/material.dart';
import 'package:hawkeyeapp/core/constants/app_colors.dart';

class Camera extends StatelessWidget {
  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        border: Border.all(
          color: AppColors.primary,
          width: 4,
        ),
      ),
    );
  }
}
