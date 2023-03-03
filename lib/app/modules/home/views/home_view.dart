import 'package:belanja/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../widget/item_grid.dart';
import '../widget/search_bar.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Galeri Lukisan',
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          splashRadius: 3.sh,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 3.sh,
            color: Colors.black,
          ),
          onPressed: () {
            Get.toNamed(AppPages.REGISTER);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_rounded,
              size: 4.sh,
              color: Colors.red,
            ),
            onPressed: null,
          ),
          SizedBox(
            width: 2.sh,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(),
            SizedBox(
              height: 2.sh,
            ),
            ItemGrid(),
          ],
        ),
      ),
    );
  }
}
