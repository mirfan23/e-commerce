// ignore_for_file: avoid_print

import 'package:belanja/helper/helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class LoginDaftarController extends GetxController {
  var verifCode = true.obs;

  // var getService = Get.put(StorageService());

  // LoginDaftarProvider provider = Get.put(LoginDaftarProvider());

  // var loginProvider = Get.put(LoginProvider());
  var isLogin = false;

  String formatNumberPhone = "";

  // ignore: non_constant_identifier_names

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
    // print(readToken());
    initTextRegister();
    initTextLogin();
    // getService.remove(GetStorageKey.userToken);
    super.onInit();
  }

  void getFormatNumber(String value) {
    formatNumberPhone = value;
    update();
  }

  void errorEnabled(String value, int index, String message) {
    // if (&& value.isNotEmpty && value.contains('@')) {
    //   enableError[index] = true;
    //   messageError[index] = message;
    //   update();
    // } else {
    //   enableError[index] = false;
    //   update();
    // }
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

  // void loginFail(String value) {
  //   Get.dialog(
  //     Align(
  //       alignment: Alignment.center,
  //       child: Wrap(
  //         children: [
  //           SizedBox(
  //             width: 50.sw,
  //             height: 50.sw,
  //             child: Material(
  //               child: Container(
  //                 height: 50.sw,
  //                 width: 50.sw,
  //                 decoration: const BoxDecoration(
  //                   color: Colors.white,
  //                 ),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       value,
  //                       textAlign: TextAlign.center,
  //                       style: const TextStyle(fontSize: 20),
  //                     ),
  //                     const SizedBox(
  //                       height: 40,
  //                     ),
  //                     PWMPButton(
  //                       title: "Tutup",
  //                       color: CustomColor.greenBackground,
  //                       onPressed: () {
  //                         Get.back();
  //                       },
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ).borderRadius(all: 20)
  //         ],
  //       ),
  //     ),
  //   );
  // }

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

  void pasteVerificationText(String temp, int index) {
    switch (index) {
      case 0:
        tFVerificationPaste[0].text = temp[0];
        tFVerificationPaste[1].text = temp[1];
        tFVerificationPaste[2].text = temp[2];
        tFVerificationPaste[3].text = temp[3];
        break;
      case 1:
        tFVerificationPaste[1].text = temp[0];
        tFVerificationPaste[2].text = temp[1];
        tFVerificationPaste[3].text = temp[2];
        break;
      case 2:
        tFVerificationPaste[2].text = temp[0];
        tFVerificationPaste[3].text = temp[1];
        break;
      case 3:
        tFVerificationPaste[3].text = temp[0];
        break;
      default:
    }
  }

  // void saveToGetStorage(String data, List<String> value) {
  //   getService.write(GetStorageKey.userToken, data);
  //   getService.write(GetStorageKey.userData, value);
  //   // getService.write(GetStorageKey.isLogin, true);
  // }

  // void login() {
  //   Get.dialog(Align(
  //     alignment: Alignment.center,
  //     child: Wrap(
  //       children: [
  //         const CircularProgressIndicator()
  //             .margin(all: 4.sh)
  //             .backgroundColor(color: Colors.white)
  //             .borderRadius(all: 14),
  //       ],
  //     ),
  //   ));
  //   try {
  //     loginProvider
  //         .provider(usernameLoginTF.text, passwordLoginTF.text)
  //         .then((value) {
  //       Get.back();
  //       print('test');
  //       // if (value.message == "Login berhasil") {
  //       // print(value.data!.token!.token);
  //       // getService.write(
  //       //     GetStorageKey.userToken, value.data!.token!.token.toString());

  //       // getService.write(GetStorageKey.userData, value.data);

  //       List<String> userData = [];
  //       userData.add(value.data!.realName!);
  //       userData.add(value.data!.namaGroup!);

  //       saveToGetStorage(
  //         value.data!.token!.token.toString(),
  //         userData,
  //       );
  //       isLogin = true;
  //       update();
  //       // print(readUserData());

  //       loading();
  //       Future.delayed(const Duration(seconds: 2), () {
  //         Get.back();
  //         Get.toNamed(AppPages.INITIAL);
  //         // print(readUserData()['id_user']);
  //         // print(readToken());
  //         // print("Timeout");
  //       });
  //       // Get.back();
  //       // Get.toNamed(AppPages.INITIAL);
  //       // print('test');
  //       //   errorEnabled("usernameLoginTF.text", 0);
  //       // } else {
  //       //   errorEnabled(passwordLoginTF.text, 1);
  //       // }
  //     }).onError((error, stackTrace) {
  //       print(error);
  //       Get.back();
  //       Get.dialog(
  //         DialogCustom.error(
  //           message: error.toString(),
  //           buttonText: "Coba Lagi",
  //           onPressed: () {
  //             Get.back();
  //           },
  //         ),
  //       );
  //       // loginFail(error.toString());
  //       // errorEnabled(passwordLoginTF.text, 1, error.toString());
  //     });
  //   } catch (e) {
  //     print("text");
  //     if (kDebugMode) {
  //       print("gagal");
  //     }
  //   }
  // }

  void register() {
    // try {
    //   provider
    //       .registerProvider(
    //         "namaKelompok",
    //         emailRegTF.text,
    //         "idSkema",
    //         "idRefKorwil",
    //         formatNumberPhone + noHPRegTF.text,
    //         passwordLoginTF.text,
    //         repasswordRegTF.text,
    //       )
    //       .then((value) => null);
    // } catch (e) {
    //   if (kDebugMode) {
    //     print("gagal");
    //   }
    // }
  }
}
