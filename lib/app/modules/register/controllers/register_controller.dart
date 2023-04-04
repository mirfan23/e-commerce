// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:galeri_lukisan/app/data/models/user_model2.dart';
import 'package:galeri_lukisan/app/data/providers/auth_provider.dart';
import 'package:galeri_lukisan/app/data/providers/local_auth.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController instance = Get.find();
  Rxn<UserModel> user = Rxn<UserModel>();
  final LocalAuth _localAuth = LocalAuth();

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmController;

  @override
  void onInit() async {
    await _localAuth.init();
    initTextRegister();
    super.onInit();
  }

  void initTextRegister() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmController = TextEditingController();
  }

  void signUp(
      {required String fullName,
      required String email,
      required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loadihng...',
        dismissOnTap: false,
      );
      var result = await Authprovider().signUp(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await Authprovider().createProfile(
          fullName: fullName,
          token: token,
        );
        if (userResult.statusCode == 200) {
          user.value = userModelFromJson(userResult.body);
          await _localAuth.addToken(token: token);
          await _localAuth.addUser(user: user.value!);
          EasyLoading.showSuccess("Selamat Datang!");
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError("Terjadi Kesalahan, Silahkan Coba Lagi!");
        }
      } else {
        EasyLoading.showError("Terjadi Kesalahan, Silahkan Coba Lagi!");
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }
}
