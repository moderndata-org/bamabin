import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constant/ScrollBehavior.dart';
import '../constant/colors.dart';

import '../constant/bindings.dart';
import '../constant/strings.dart';
import 'routes/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('bamabin');
  runApp(const Main());
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
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 350),
      initialBinding: MyBindings(),
      scrollBehavior: MyBehavior(),
      getPages: Routes.page,
      initialRoute: '/splash',
      theme: ThemeData(fontFamily: "iransans"),
      debugShowCheckedModeBanner: false,
    );
  }
}
