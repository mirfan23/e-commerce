import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}
