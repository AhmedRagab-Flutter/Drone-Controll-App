import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawkeyeapp/core/constants/app_colors.dart';
import 'package:hawkeyeapp/core/constants/app_textstyles.dart';
import 'package:hawkeyeapp/view/widgets/auth/auth_button.dart';
import 'package:hawkeyeapp/view/widgets/info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text("Home",
            style: AppTextStyles.heading2.copyWith(
              fontWeight: FontWeight.bold,
            )),
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            Text("How The App Works",
                style: AppTextStyles.bodyText1.copyWith(fontSize: 20)),
            const Spacer(flex: 1),
            Center(
              child: Image.asset(
                "assets/images/drone.png",
                height: 170,
              ),
            ),
            const Info(
              text:
                  "The App main idea is to controll a drone \nby giving it the coordenates for the points \nit should visit.",
            ),
            const Info(
              text:
                  "You can send waypoints to the drone and \nthe drone will move based on this waypoints.",
            ),
            const Info(
              text:
                  "You can also recive the drone's camera \nfeedback and have alook on it inside \nthe app.",
            ),
            const Spacer(flex: 1),
            Row(
              children: [
                const Spacer(),
                AuthButton(
                  text: "Start",
                  onPressed: () {
                    Get.toNamed("/waypoints");
                  },
                )
              ],
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
