import 'package:flutter/material.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class CategoryChip extends StatelessWidget {
  final String categoryName;
  final homeController = Get.find<HomeController>();

  CategoryChip({
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle category tap
        homeController.getProductFilter(keyword: categoryName);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Color.fromRGBO(54, 105, 201, 0.9),
          width: 15.sh,
          padding: EdgeInsets.all(1.5.sh),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
