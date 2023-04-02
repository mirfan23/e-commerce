import 'package:flutter/material.dart';
import 'package:galeri_lukisan/app/modules/home/views/dashboard_fragment.dart';
import 'package:galeri_lukisan/app/modules/login/views/login_view.dart';
import 'package:galeri_lukisan/helper/user_preferences.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    GetMaterialApp(
      title: "Application",
      // initialRoute: AppPages.LOGIN,
      getPages: AppPages.routes,
      home: FutureBuilder(
        future: RememberUserPreferences.readUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return LoginView();
          } else {
            return DashboardFragment();
          }
        },
      ),
    ),
  );
}
