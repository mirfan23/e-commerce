import 'package:belanja/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginOrDaftar extends StatelessWidget {
  const LoginOrDaftar({
    Key? key,
    required this.temp,
  }) : super(key: key);

  final String temp;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        temp == "login" ? "Sudah punya akun? " : "Belum punya akun? ",
        style: TextStyle(
          fontSize: 10,
        ),
      ),
      InkWell(
        onTap: () => temp == "login"
            ? Get.toNamed(AppPages.LOGIN)
            : Get.toNamed(AppPages.REGISTER),
        child: Text(temp == "login" ? "Masuk" : "Daftar",
            style: TextStyle(fontSize: 10, color: Colors.blue)),
      ),
    ]);
  }
}
