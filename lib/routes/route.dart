import 'package:bamabin/screens/authentication/forget_password_screen.dart';
import 'package:bamabin/screens/favorite_screen.dart';
import 'package:bamabin/screens/notifications_screen.dart';
import 'package:bamabin/screens/authentication/signin_screen.dart';
import 'package:bamabin/screens/part_screen.dart';
import 'package:bamabin/screens/player/player_screen.dart';
import 'package:bamabin/screens/profile_screen.dart';
import 'package:bamabin/screens/recent_views_screen.dart';
import 'package:bamabin/screens/subscribes/subscribe_screen.dart';
import 'package:bamabin/screens/tickets/ticket_details.dart';
import 'package:bamabin/screens/tickets/tickets_screen.dart';
import 'package:get/get.dart';

import '../screens/aboutus_screen.dart';
import '../screens/authentication/signin_qrcode_screen.dart';
import '../screens/authentication/signup_screen.dart';
import '../screens/main_screen.dart';
import '../screens/orders/order_list_edit_items_screen.dart';
import '../screens/orders/order_list_screen.dart';
import '../screens/requests/request_list_screen.dart';
import '../screens/splash_screen.dart';

class Routes {
  static List<GetPage> get page => [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/signin', page: () => const SigninScreen()),
        GetPage(name: '/signin-qrcode', page: () => const SignInQrCodeScreen()),
        GetPage(name: '/notifications', page: () => const NotificationScreen()),
        GetPage(name: '/ticket-details', page: () => const TicketDetails()),
        GetPage(name: '/player', page: () => const PlayerScreen()),
        GetPage(
            name: '/forgetpassword', page: () => const ForgetPasswordScreen()),
        GetPage(name: '/signup', page: () => const SignupScreen()),
        GetPage(name: '/main', page: () => const MainScreen()),
        GetPage(name: '/favorite', page: () => const FavoriteScreen()),
        GetPage(name: '/order', page: () => const OrderlistScreen()),
        GetPage(
            name: '/order-edit-item',
            page: () => const OrderlistEditItemsScreen()),
        GetPage(name: '/aboutus', page: () => const AboutusScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(name: '/subscribe', page: () => const SubscribeScreen()),
        GetPage(name: '/request', page: () => const RequestListScreen()),
        GetPage(name: '/tickets', page: () => const TicketsScreen()),
        GetPage(name: '/part', page: () => const PartScreen()),
        GetPage(name: '/recent-views', page: () => const RecentViewsScreen()),
      ];

}
