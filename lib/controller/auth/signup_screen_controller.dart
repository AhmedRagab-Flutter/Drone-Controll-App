import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  final _auth = FirebaseAuth.instance;
  late TextEditingController email;
  late TextEditingController password;

  @override
  goToLogin() {
    Get.offNamed("/login");
  }

  createAccountAndGoToLogin() async {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Get.back();
      await Get.defaultDialog(
        title: "Done",
        content: const Text("Acount have been Created successfully"),
      );
      Get.offAllNamed("/login");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.back();
        Get.defaultDialog(
          title: "Note",
          content: const Text("The password provided is too weak"),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.back();
        Get.defaultDialog(
          title: "Note",
          content: const Text("The account already exists for that email"),
        );
      } else {
        Get.back();
        Get.defaultDialog(
          title: "Error",
          content: const Text("Please Try Again"),
        );
      }
    } catch (e) {
      Get.back();
      Get.defaultDialog(
        title: "Error",
        content: const Text("Please Try Again"),
      );
    }
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
