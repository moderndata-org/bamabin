import 'package:bamabin/models/film_model.dart';
import 'package:bamabin/models/recent_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../constant/ScrollBehavior.dart';
import '../constant/colors.dart';
import '../constant/bindings.dart';
import '../constant/strings.dart';
import 'firebase_options.dart';
import 'routes/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('bamabin');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(RecentModelAdapter());
  await Hive.openBox<RecentModel>('recents');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const Main());
  });
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
