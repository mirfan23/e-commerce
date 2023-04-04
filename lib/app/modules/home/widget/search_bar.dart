// ignore_for_file: depend_on_referenced_packages

import 'package:galeri_lukisan/app/modules/home/controllers/home_controller.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  final controller = Get.put(HomeController());
  SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.sh,
      margin: EdgeInsets.only(
        left: 2.sh,
        right: 2.sh,
        bottom: 2.sh,
        top: 6.sh,
      ),
      child: TextField(
        onSubmitted: (val) {
          controller.getProductByName(keyword: val);
          controller.getProductByPelukis(keyword: val);
        },
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(1.5.sh),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 1.sh,
            ),
          ),
          hintText: "Search Product Name",
          hintTextDirection: TextDirection.ltr,
          suffixIcon: Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
