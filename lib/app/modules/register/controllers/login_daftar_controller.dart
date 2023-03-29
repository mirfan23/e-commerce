// ignore_for_file: avoid_print, depend_on_referenced_packages, unused_import

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:galeri_lukisan/app/data/providers/api_connection.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/user_Model.dart';

class LoginDaftarController extends GetxController {
  var verifCode = true.obs;
  var isLogin = false;

  String formatNumberPhone = "";

  late TextEditingController usernameLoginTF;
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

  void getFormatNumber(String value) {
    formatNumberPhone = value;
    update();
  }

  void errorEnabled(String value, int index, String message) {
    enableError[index] = true;
    messageError.insert(index, message);
    update();
  }

  void initTextRegister() {
    usernameRegTF = TextEditingController();
    emailRegTF = TextEditingController();
    noHPRegTF = TextEditingController();
    passwordRegTF = TextEditingController();
    repasswordRegTF = TextEditingController();
  }

  void initTextLogin() {
    usernameLoginTF = TextEditingController();
    passwordLoginTF = TextEditingController();
  }

  void focusNodeVerifBtn(int temp) {
    nodeVerif[temp].requestFocus();
  }

  void updateTextField(index) {
    tfObscure[index] = !tfObscure[index];
    update();
  }

  void loading() {
    Get.dialog(
      Wrap(
        children: [
          SizedBox(
            width: 100.sw,
            height: 100.sh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 10.sh,
                  width: 10.sh,
                  child: const CircularProgressIndicator(),
                ),
              ],
            ),
          )
        ],
      ),
      barrierDismissible: false,
    );
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
}
