import 'package:belanja/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_daftar_controller.dart';

class VerifikasiTextField extends StatelessWidget {
  VerifikasiTextField({
    Key? key,
    required this.counter,
  }) : super(key: key);

  final logindaftarC = Get.put(LoginDaftarController());

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14.sw,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.grey, // set border color
            width: 1.0), // set border width
        borderRadius: const BorderRadius.all(
            Radius.circular(7.0)), // set rounded corner radius
      ),
      child: TextField(
        controller: logindaftarC.tFVerificationPaste[counter],
        onChanged: ((value) {
          if (value.length > 1) {
            logindaftarC.pasteVerificationText(value, counter);
          } else if (value.length == 1 && counter < 3) {
            logindaftarC.focusNodeVerifBtn(counter + 1);
          } else if (value.isEmpty) {
            logindaftarC
                .focusNodeVerifBtn((counter == 0) ? counter : counter - 1);
          }
        }),
        focusNode: logindaftarC.nodeVerif[counter],
        autofocus: false,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: percentageOfScreenHeight(3.5),
            horizontal: percentageOfScreenWidth(4),
          ),
        ),
      ),
    );
  }
}
