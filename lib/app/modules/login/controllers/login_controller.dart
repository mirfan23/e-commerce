// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController usernameLoginTF;
  late TextEditingController passwordLoginTF;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    initTextLogin();
  }

  void initTextLogin() {
    usernameLoginTF = TextEditingController();
    passwordLoginTF = TextEditingController();
  }
}
