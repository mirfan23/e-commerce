// ignore_for_file: avoid_print, depend_on_referenced_packages, unused_import

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:galeri_lukisan/app/data/providers/api_connection.dart';
import 'package:galeri_lukisan/app/modules/home/views/dashboard_fragment.dart';
import 'package:galeri_lukisan/app/modules/home/views/home_view.dart';
import 'package:galeri_lukisan/app/routes/app_pages.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:galeri_lukisan/helper/user_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/user_Model.dart';

class LoginDaftarController extends GetxController {
  var verifCode = true.obs;
  var isLogin = false;

  late TextEditingController emailLoginTF;
  late TextEditingController passwordLoginTF;

  late TextEditingController usernameRegTF;
  late TextEditingController emailRegTF;
  late TextEditingController noHPRegTF;
  late TextEditingController passwordRegTF;
  late TextEditingController repasswordRegTF;

  final tFVerificationPaste = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  var tfObscure = [
    true, // password login
    true, // password register
    true, // re-password register
  ];

  var nodeVerif = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  var enableError = [
    false,
    false,
  ];

  List<String> messageError = [];

  var showAnimation = false.obs;

  @override
  void onInit() {
    initTextRegister();
    initTextLogin();
    super.onInit();
  }

  void errorEnabled(String value, int index, String message) {
    enableError[index] = true;
    messageError.insert(index, message);
    update();
  }

  void initTextRegister() {
    usernameRegTF = TextEditingController();
    emailRegTF = TextEditingController();
    passwordRegTF = TextEditingController();
    repasswordRegTF = TextEditingController();
  }

  void initTextLogin() {
    emailLoginTF = TextEditingController();
    passwordLoginTF = TextEditingController();
  }

  void focusNodeVerifBtn(int temp) {
    nodeVerif[temp].requestFocus();
  }

  void updateTextField(index) {
    tfObscure[index] = !tfObscure[index];
    update();
  }

  validateUserEmail() async {
    try {
      var res = await http.post(
          Uri.parse(
            API.validateEmail,
          ),
          body: {
            'user_email': emailRegTF.text.trim(),
          });
      if (res.statusCode == 200) {
        //connection success
        var resBodyOfValidateEmail = jsonDecode(res.body);

        if (resBodyOfValidateEmail['emailFound'] == true) {
          Fluttertoast.showToast(msg: "Email sudah dipakai oleh orang lain");
        } else {
          registerAndSaveUserRecord();
        }
      }
    } catch (e) {}
  }

  registerAndSaveUserRecord() async {
    User userModel = User(
      1,
      usernameRegTF.text.trim(),
      emailRegTF.text.trim(),
      passwordRegTF.text.trim(),
    );

    try {
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );

      if (res.statusCode == 200) {
        var responBodySignUp = jsonDecode(res.body);
        if (responBodySignUp['success']) {
          Fluttertoast.showToast(msg: "Register Berhasil");

          usernameRegTF.clear();
          emailRegTF.clear();
          passwordRegTF.clear();
        } else {
          Fluttertoast.showToast(msg: "Terjadi Error, Silahkan Coba Lagi");
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  loginUserNow() async {
    try {
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          "user_email": emailLoginTF.text.trim(),
          "user_password": passwordLoginTF.text.trim(),
        },
      );
      print(res.body);

      if (res.statusCode == 200) {
        var responBodyLogin = jsonDecode(res.body);
        if (responBodyLogin['success'] == true) {
          Fluttertoast.showToast(msg: "Login Berhasil");

          User userInfo = User.fromJson(responBodyLogin["userData"]);

          await RememberUserPreferences.storeUserInfo(userInfo);

          Future.delayed(Duration(milliseconds: 500), () {
            Get.to(() => DashboardFragment());
          });
        } else {
          Fluttertoast.showToast(
              msg:
                  "Terjadi Kesalahan pada Email atau Password, \nSilahkan Coba Lagi");
        }
      }
    } catch (e) {
      print("Error::" + e.toString());
    }
  }
}
