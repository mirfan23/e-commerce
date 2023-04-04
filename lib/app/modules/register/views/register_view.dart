// ignore_for_file: depend_on_referenced_packages

import 'package:galeri_lukisan/app/modules/login/views/login_view.dart';
import 'package:galeri_lukisan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:galeri_lukisan/helper/string_extension.dart';

import 'package:get/get.dart';

import '../../../../helper/input_outline_button.dart';
import '../../../../helper/input_text_button.dart';
import '../../../../helper/input_text_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  // final loginDaftarC = Get.put(LoginDaftarController());
  final RegisterController registerController = Get.put(RegisterController());
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text("Create Account,",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                const Text(
                  "Sign up to started!",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2),
                ),
                const Spacer(
                  flex: 3,
                ),
                InputTextField(
                  title: 'Full Name',
                  textEditingController: registerController.fullNameController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Email',
                  textEditingController: registerController.emailController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else if (!value.isValidEmail) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Password',
                  obsecureText: true,
                  textEditingController: registerController.passwordController,
                  validation: (String? value) {
                    List<String> _validation = [];
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    String msg = '';
                    if (_validation.isNotEmpty) {
                      for (var i = 0; i < _validation.length; i++) {
                        msg = msg + _validation[i];
                        if ((i + 1) != _validation.length) {
                          msg = msg + "\n";
                        }
                      }
                    }
                    return msg.isNotEmpty ? msg : null;
                  },
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Confirm Password',
                  obsecureText: true,
                  textEditingController: registerController.confirmController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else if (registerController.passwordController.text !=
                        value) {
                      return "Confirm password not match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Spacer(),
                InputTextButton(
                  title: "Sign Up",
                  onClick: () {
                    if (formKey.currentState!.validate()) {
                      registerController.signUp(
                        fullName: registerController.fullNameController.text,
                        email: registerController.emailController.text,
                        password: registerController.passwordController.text,
                      );
                      Get.toNamed(AppPages.LOGIN);
                    }
                  },
                ),
                const SizedBox(height: 10),
                InputOutlineButton(
                  title: "Back",
                  onClick: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Spacer(
                  flex: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("I'm already a member, "),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView()));
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         padding: EdgeInsets.all(1.sh),
      //         child: Column(
      //           children: [
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             Form(
      //               key: formKey,
      //               child: Column(
      //                 children: [
      //                   LoginDaftarTextView(
      //                     title: "Nama",
      //                   ),
      //                   LoginDaftarTextField(
      //                     title: "Nama lengkap kamu",
      //                     index: 9,
      //                     filltext: loginDaftarC.usernameRegTF,
      //                   ),
      //                   const SizedBox(
      //                     height: 20,
      //                   ),
      //                   LoginDaftarTextView(
      //                     title: "Email",
      //                   ),
      //                   LoginDaftarTextField(
      //                     title: "Masukkan emailmu",
      //                     index: 9,
      //                     filltext: loginDaftarC.emailRegTF,
      //                   ),
      //                   const SizedBox(
      //                     height: 20,
      //                   ),
      //                   const SizedBox(
      //                     height: 20,
      //                   ),
      //                   LoginDaftarTextView(
      //                     title: "Buat Kata Sandi",
      //                   ),
      //                   LoginDaftarTextField(
      //                     title: "Masukkan kata sandi",
      //                     index: 1,
      //                     filltext: loginDaftarC.passwordRegTF,
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             const LoginDaftarDivider(
      //               title: 'daftar',
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             ElevatedButton(
      //               onPressed: () {
      //                 if (formKey.currentState!.validate()) {
      //                   loginDaftarC.validateUserEmail();
      //                   // Get.toNamed(AppPages.LOGIN);
      //                 }
      //               },
      //               child: Container(
      //                 alignment: Alignment.center,
      //                 height: 5.sh,
      //                 width: 15.sh,
      //                 child: Text("Register"),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             const LoginOrDaftar(temp: 'login'),
      //             const SizedBox(
      //               height: 5,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
