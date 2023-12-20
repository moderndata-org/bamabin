import 'package:get/get.dart';

import '../screens/splash_screen.dart';

class Routes {
  static List<GetPage> get page => [
        GetPage(name: '/splash', page: () => const SplashScreen()),
      ];
}
