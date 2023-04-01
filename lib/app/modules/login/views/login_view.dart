import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../register/controllers/login_daftar_controller.dart';
import '../../register/widgets/login_daftar_divider.dart';
import '../../register/widgets/login_daftar_text_field.dart';
import '../../register/widgets/login_daftar_text_view.dart';
import '../../register/widgets/login_or_daftar.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final loginDaftarC = Get.put(LoginDaftarController());
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(1.sh),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  LoginDaftarTextView(
                    title: "Email",
                  ),
                  LoginDaftarTextField(
                    title: "Masukkan emailmu",
                    index: 9,
                    filltext: loginDaftarC.emailLoginTF,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LoginDaftarTextView(
                    title: "Buat Kata Sandi",
                  ),
                  LoginDaftarTextField(
                    title: "Masukkan kata sandi",
                    index: 1,
                    filltext: loginDaftarC.passwordLoginTF,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const LoginDaftarDivider(
                    title: 'masuk',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      loginDaftarC.loginUserNow();
                      // if (formKey.currentState!.validate()) {}
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 5.sh,
                      width: 15.sh,
                      child: Text("Log in"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const LoginOrDaftar(temp: 'masuk'),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
