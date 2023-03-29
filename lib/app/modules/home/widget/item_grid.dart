// ignore_for_file: depend_on_referenced_packages

import 'package:galeri_lukisan/app/data/models/product_model.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:galeri_lukisan/helper/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/list.dart';
import '../../../routes/app_pages.dart';

class ItemGrid extends StatelessWidget {
  const ItemGrid({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);

  final ProductModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 3.sh, left: 3.sh),
      child: GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.sh,
          mainAxisSpacing: 2.sh,
        ),
        itemCount: model.data.length,
        itemBuilder: ((__, index) {
          return Column(
            children: [
              // Image(
              //   image: model.data[index].attributes.images as ImageProvider,
              //   width: 19.sw,
              // ),
              SizedBox(
                height: 1.sh,
              ),
              Text(
                model.data[index].attributes.title,
                style: TextStyle(fontSize: 12, color: Colors.black),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ).margin(all: 2.sh).button(
                elevation: 3,
                onPressed: () {
                  Get.toNamed(AppPages.DETAIL);
                },
              );
        }),
      ),
    );
  }
}
