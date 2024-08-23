import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hawkeyeapp/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
