import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _auth = FirebaseAuth.instance;
  late TextEditingController email;
  late TextEditingController password;

  goToHomeScreen(String email, String password) async {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      if (user != null) {
        Get.back();
        Get.offNamed("/home");
      }
    } catch (e) {
      Get.back();
      Get.defaultDialog(
        title: "Error",
        content: const Text("Wrong Email or Password"),
      );
    }
  }

  goToSignUpScreen() {
    Get.toNamed("/signup");
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
