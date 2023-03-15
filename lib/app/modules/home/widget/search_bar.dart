// ignore_for_file: depend_on_referenced_packages

import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.sh,
      // color: Colors.amber,
      margin: EdgeInsets.only(
        left: 2.sh,
        right: 2.sh,
        bottom: 2.sh,
        top: 6.sh,
      ),
      // padding: EdgeInsets.all(4.sh),
      child: TextField(
        textAlign: TextAlign.start,
        // autofocus: true,
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
