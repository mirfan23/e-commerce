// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:galeri_lukisan/app/data/models/user_model2.dart';
import 'package:galeri_lukisan/app/data/providers/auth_provider.dart';
import 'package:galeri_lukisan/app/data/providers/local_auth.dart';
import 'package:galeri_lukisan/app/modules/home/views/dashboard_fragment.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();
  Rxn<UserModel> user = Rxn<UserModel>();
  final LocalAuth _localAuthService = LocalAuth();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    initTextLogin();
    await _localAuthService.init();
  }

  void initTextLogin() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      var result = await Authprovider().signIn(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await Authprovider().getProfile(token: token);
        if (userResult.statusCode == 200) {
          user.value = userModelFromJson(userResult.body);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess("Welcome to MyGrocery!");
          Get.to(DashboardFragment());
          // Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError('Something wrong. Try again!');
        }
      } else {
        EasyLoading.showError('Username/password wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    user.value = null;
    await _localAuthService.clear();
  }
}
