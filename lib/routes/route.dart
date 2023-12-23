import 'package:bamabin/screens/forget_password_screen.dart';
import 'package:bamabin/screens/notifications_screen.dart';
import 'package:bamabin/screens/signin_qrcode_screen.dart';
import 'package:bamabin/screens/signin_screen.dart';
import 'package:bamabin/screens/signup_screen.dart';
import 'package:get/get.dart';

import '../screens/main_screen.dart';
import '../screens/splash_screen.dart';

class Routes {
  static List<GetPage> get page => [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/signin', page: () => const SigninScreen()),
        GetPage(name: '/signin-qrcode', page: () => const SignInQrCodeScreen()),
        GetPage(name: '/notifications', page: () => const NotificationScreen()),
        GetPage(
            name: '/forgetpassword', page: () => const ForgetPasswordScreen()),
        GetPage(name: '/signup', page: () => const SignupScreen()),
        GetPage(name: '/main', page: () => const MainScreen()),
      ];
}
