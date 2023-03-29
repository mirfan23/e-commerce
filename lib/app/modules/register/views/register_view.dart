// ignore_for_file: depend_on_referenced_packages

import 'package:galeri_lukisan/app/routes/app_pages.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_daftar_controller.dart';
import '../controllers/register_controller.dart';
import '../widgets/login_daftar_divider.dart';
import '../widgets/login_daftar_text_field.dart';
import '../widgets/login_daftar_text_view.dart';
import '../widgets/login_or_daftar.dart';

class RegisterView extends GetView<RegisterController> {
  final loginDaftarC = Get.put(LoginDaftarController());
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterView'),
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
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        LoginDaftarTextView(
                          title: "Nama",
                        ),
                        LoginDaftarTextField(
                          title: "Nama lengkap kamu",
                          index: 9,
                          filltext: loginDaftarC.usernameRegTF,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginDaftarTextView(
                          title: "Email",
                        ),
                        LoginDaftarTextField(
                          title: "Masukkan emailmu",
                          index: 9,
                          filltext: loginDaftarC.emailRegTF,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // LoginDaftarTextView(
                        //   title: "Nomor Ponsel",
                        // ),
                        // LoginDaftarTextField(
                        //   title: "Ex. 8213456789",
                        //   index: 9,
                        //   filltext: loginDaftarC.noHPRegTF,
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginDaftarTextView(
                          title: "Buat Kata Sandi",
                        ),
                        LoginDaftarTextField(
                          title: "Masukkan kata sandi",
                          index: 1,
                          filltext: loginDaftarC.passwordRegTF,
                        ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // LoginDaftarTextView(
                        //   title: "Buat Kata Sandi",
                        // ),
                        // LoginDaftarTextField(
                        //   title: "Masukkan kata sandi",
                        //   index: 2,
                        //   filltext: loginDaftarC.repasswordRegTF,
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const LoginDaftarDivider(
                    title: 'daftar',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        loginDaftarC.validateUserEmail();
                        // Get.toNamed(AppPages.LOGIN);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 5.sh,
                      width: 15.sh,
                      child: Text("Register"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const LoginOrDaftar(temp: 'login'),
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
