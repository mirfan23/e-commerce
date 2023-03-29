// ignore_for_file: depend_on_referenced_packages

import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_daftar_controller.dart';

class LoginDaftarTextField extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const LoginDaftarTextField({
    required this.title,
    required this.index,
    required this.filltext,
    this.enableValidate,
    this.indexValidate,
    this.suggestion,
  });

  // final loginDaftarC = Get.put(LoginDaftarController());

  final String title;
  final int index;
  final int? indexValidate;
  final TextEditingController filltext;
  final bool? enableValidate;
  final bool? suggestion;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginDaftarController>(
        init: LoginDaftarController(),
        builder: (controller) {
          return TextFormField(
              enableSuggestions: suggestion ?? false,
              controller: filltext,
              validator: ((value) =>
                  value == "" ? "Tolong Diisi dengan Benar" : null),
              textAlignVertical: TextAlignVertical.center,
              obscureText: index == 9 ? false : controller.tfObscure[index],
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: Colors.grey),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: Colors.red),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: (context.isTablet ? 2 : 2.5).sh,
                    horizontal: (context.isTablet ? 3 : 4).sw,
                  ),
                  hintText: title,
                  suffixIcon: (title.substring(9, 13) == 'kata')
                      ? IconButton(
                          icon: Icon(
                              // Based on passwordVisible state choose the icon
                              controller.tfObscure[index]
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.remove_red_eye,
                              color: Colors.grey),
                          onPressed: () {
                            controller.updateTextField(index);
                          },
                        )
                      : null,
                  prefixIcon: (title.substring(0, 2) == 'Ex')
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CountryCodePicker(
                              onInit: ((value) {
                                controller.formatNumberPhone = value.toString();
                              }),
                              onChanged: ((value) =>
                                  controller.getFormatNumber(value.toString())),
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: 'ID',
                              favorite: const ['+62', 'ID'],
                              dialogSize: Size(
                                90.sw,
                                80.sh,
                              ),
                              showCountryOnly: false,
                              showFlag: false,
                              padding: EdgeInsets.zero,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              // optional. aligns the flag and the Text left
                              alignLeft: false,
                            ),
                            Image.asset(
                              'assets/icons/ic_tf_notelp.png',
                              height: 6,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        )
                      : null));
        });
  }
}
