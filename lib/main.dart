import 'package:bamabin/models/recent_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../constant/ScrollBehavior.dart';
import '../constant/colors.dart';
import '../constant/bindings.dart';
import '../constant/strings.dart';
import 'firebase_options.dart';
import 'routes/route.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('bamabin');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  await Hive.initFlutter();
  Hive.registerAdapter(RecentModelAdapter());
  await Hive.openBox<RecentModel>('recents');
  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://1ced29258580ebe06548afc530735561@o331112.ingest.us.sentry.io/4507039393513472';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      runApp(const Main());
    }),
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: cPrimaryDark, // navigation bar color
      statusBarColor: cPrimaryDark,
      statusBarBrightness: Brightness.dark));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: strAppName,
      defaultTransition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 350),
      initialBinding: MyBindings(),
      scrollBehavior: MyBehavior(),
      getPages: Routes.page,
      initialRoute: '/splash',
      theme: ThemeData(fontFamily: "vazir"),
      debugShowCheckedModeBanner: false,
    );
  }
}
