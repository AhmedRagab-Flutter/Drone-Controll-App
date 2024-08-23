import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "تسجيل الدخول",
          "2": "من فضلك سجل دخولك للمتابعة",
          "3": "بريد إلكتروني",
          "4": "كلمة المرور",
        },
        "en": {
          "1": "Login",
          "2": "Please Sign in to Continue",
          "3": "email",
          "4": "password",
        },
      };
}
