import 'package:bamabin/screens/authentication/forget_password_screen.dart';
import 'package:bamabin/screens/notifications_screen.dart';
import 'package:bamabin/screens/authentication/signin_screen.dart';
import 'package:bamabin/screens/tickets/ticket_details.dart';
import 'package:get/get.dart';

import '../screens/authentication/signin_qrcode_screen.dart';
import '../screens/authentication/signup_screen.dart';
import '../screens/main_screen.dart';
import '../screens/splash_screen.dart';

class Routes {
  static List<GetPage> get page => [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/signin', page: () => const SigninScreen()),
        GetPage(name: '/signin-qrcode', page: () => const SignInQrCodeScreen()),
        GetPage(name: '/notifications', page: () => const NotificationScreen()),
        GetPage(name: '/ticket-details', page: () => const TicketDetails()),
        GetPage(
            name: '/forgetpassword', page: () => const ForgetPasswordScreen()),
        GetPage(name: '/signup', page: () => const SignupScreen()),
        GetPage(name: '/main', page: () => const MainScreen()),
      ];
}
