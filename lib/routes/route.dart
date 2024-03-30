import 'package:bamabin/screens/authentication/forget_password_screen.dart';
import 'package:bamabin/screens/download_manager_screen.dart';
import 'package:bamabin/screens/favorite_screen.dart';
import 'package:bamabin/screens/filter_screen.dart';
import 'package:bamabin/screens/genre_screen.dart';
import 'package:bamabin/screens/movie_details_screen.dart';
import 'package:bamabin/screens/notifications_screen.dart';
import 'package:bamabin/screens/authentication/signin_screen.dart';
import 'package:bamabin/screens/part_screen.dart';
import 'package:bamabin/screens/player/new_player.dart';
import 'package:bamabin/screens/player/player_screen.dart';
import 'package:bamabin/screens/profile_screen.dart';
import 'package:bamabin/screens/recent_views_screen.dart';
import 'package:bamabin/screens/search/search_screen.dart';
import 'package:bamabin/screens/subscribes/subscribe_screen.dart';
import 'package:bamabin/screens/tickets/ticket_details.dart';
import 'package:bamabin/screens/tickets/tickets_screen.dart';
import 'package:get/get.dart';

import '../screens/aboutus_screen.dart';
import '../screens/authentication/signin_qrcode_screen.dart';
import '../screens/authentication/signup_screen.dart';
import '../screens/main_screen.dart';
import '../screens/more_screen.dart';
import '../screens/orders/order_list_edit_items_screen.dart';
import '../screens/orders/order_list_screen.dart';
import '../screens/movie_requests/movie_request_list_screen.dart';
import '../screens/splash_screen.dart';

class Routes {
  static List<GetPage> get page => [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/signin', page: () => SigninScreen()),
        GetPage(name: '/signin-qrcode', page: () => const SignInQrCodeScreen()),
        GetPage(name: '/notifications', page: () => const NotificationScreen()),
        GetPage(name: '/ticket-details', page: () => TicketDetails()),
        GetPage(name: '/player', page: () => PlayerScreen()),
        GetPage(
            name: '/forgetpassword', page: () => const ForgetPasswordScreen()),
        GetPage(name: '/signup', page: () => const SignupScreen()),
        GetPage(name: '/main', page: () => MainScreen()),
        GetPage(name: '/favorite', page: () => const FavoriteScreen()),
        GetPage(name: '/order', page: () => const OrderlistScreen()),
        GetPage(
            name: '/order-edit-item',
            page: () => const OrderlistEditItemsScreen()),
        GetPage(name: '/aboutus', page: () => const AboutusScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(name: '/subscribe', page: () => const SubscribeScreen()),
        GetPage(name: '/request', page: () => const MovieRequestListScreen()),
        GetPage(name: '/tickets', page: () => const TicketsScreen()),
        GetPage(name: '/part', page: () => PartScreen()),
        GetPage(name: '/recent-views', page: () => const RecentViewsScreen()),
        GetPage(name: '/search', page: () => const SearchScreen()),
        // GetPage(
        //     name: '/download-manager',
        //     page: () => const DownloadManagerScreen()),
        GetPage(name: '/movie-detail', page: () => const MovieDetailsScreen()),
        GetPage(name: '/geners', page: () => GenreScreen()),
        GetPage(name: '/more', page: () => MoreScreen()),
        GetPage(name: '/filter', page: () => FilterScreen()),
      ];
}
