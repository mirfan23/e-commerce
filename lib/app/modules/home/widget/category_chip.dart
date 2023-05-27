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
          color: Colors.grey.withOpacity(0.7),
          width: 10.sh,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                categoryName,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
