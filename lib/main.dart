import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:galeri_lukisan/app/data/models/user_model2.dart';
import 'package:galeri_lukisan/helper/user_preferences.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/modules/home/views/dashboard_fragment.dart';
import 'app/modules/login/views/login_view.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());

  configLoading();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.LOGIN,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
      // debugShowCheckedModeBanner: false,
      // home: FutureBuilder(
      //   future: RememberUserPreferences.readUserInfo(),
      //   builder: (context, snapshot) {
      //     if (snapshot.data == null) {
      //       return LoginView();
      //     } else {
      //       return DashboardFragment();
      //     }
      //   },
      // ),
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = true;
}
