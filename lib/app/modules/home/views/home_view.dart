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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(),
            Divider(
              thickness: 0.4,
              indent: 2.sh,
              endIndent: 2.sh,
              color: Colors.grey.withOpacity(0.5),
            ),
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
