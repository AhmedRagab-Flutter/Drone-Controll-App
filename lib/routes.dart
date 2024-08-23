import 'package:get/get.dart';
import 'package:hawkeyeapp/view/screens/auth/signup_screen.dart';
import 'package:hawkeyeapp/view/screens/camera_view.dart';
import 'package:hawkeyeapp/view/screens/home_screen.dart';
import 'package:hawkeyeapp/view/screens/waypoints.dart';
import 'package:hawkeyeapp/view/screens/auth/login_screen.dart';
import 'package:hawkeyeapp/view/screens/splash_screen.dart';

List<GetPage<dynamic>>? routes = [
  // Splash
  GetPage(name: "/splash", page: () => SplashScreen()),
  // Auth
  GetPage(name: "/login", page: () => const LoginScreen()),
  GetPage(name: "/signup", page: () => const SignupScreen()),
  // main
  GetPage(name: "/home", page: () => const HomeScreen()),
  GetPage(name: "/waypoints", page: () => Waypoints()),
  GetPage(name: "/video", page: () => VideoScreen()),
];
