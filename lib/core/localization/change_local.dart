import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawkeyeapp/core/services/services.dart';

class LocalController extends GetxController {
  Locale? language;
  AppServices myServices = Get.find();
  // ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    // appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    // Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      // appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      // appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      // appTheme = themeEnglish;
    }
    super.onInit();
  }
}
