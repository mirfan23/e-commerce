import 'package:galeri_lukisan/app/modules/register/views/register_view.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:galeri_lukisan/helper/string_extension.dart';

import 'package:get/get.dart';

import '../../../../helper/input_outline_button.dart';
import '../../../../helper/input_text_button.dart';
import '../../../../helper/input_text_field.dart';
import '../../register/controllers/login_daftar_controller.dart';
import '../../register/widgets/login_daftar_divider.dart';
import '../../register/widgets/login_daftar_text_field.dart';
import '../../register/widgets/login_daftar_text_view.dart';
import '../../register/widgets/login_or_daftar.dart';
import '../controllers/login_controller.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key}) : super(key: key);

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

class LoginView extends GetView<LoginController> {
  // final loginDaftarC = Get.put(LoginDaftarController());
  var formKey = GlobalKey<FormState>();
  // final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Log to Continue",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                ),
                Spacer(),
                InputTextField(
                  title: 'Email',
                  textEditingController: controller.emailController,
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
                  textEditingController: controller.passwordController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                InputTextButton(
                  title: "Sign In",
                  onClick: () {
                    if (formKey.currentState!.validate()) {
                      controller.signIn(
                          email: controller.emailController.text,
                          password: controller.passwordController.text);
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
                    const Text("I'm new user, "),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterView()));
                      },
                      child: const Text(
                        "Sign Up",
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
      //             LoginDaftarTextView(
      //               title: "Email",
      //             ),
      //             LoginDaftarTextField(
      //               title: "Masukkan emailmu",
      //               index: 9,
      //               filltext: loginDaftarC.emailLoginTF,
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             LoginDaftarTextView(
      //               title: "Buat Kata Sandi",
      //             ),
      //             LoginDaftarTextField(
      //               title: "Masukkan kata sandi",
      //               index: 1,
      //               filltext: loginDaftarC.passwordLoginTF,
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             const LoginDaftarDivider(
      //               title: 'masuk',
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             ElevatedButton(
      //               onPressed: () {
      //                 loginDaftarC.loginUserNow();
      //                 // if (formKey.currentState!.validate()) {}
      //               },
      //               child: Container(
      //                 alignment: Alignment.center,
      //                 height: 5.sh,
      //                 width: 15.sh,
      //                 child: Text("Log in"),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             const LoginOrDaftar(temp: 'masuk'),
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
