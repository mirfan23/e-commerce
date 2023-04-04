import 'package:galeri_lukisan/app/modules/home/widget/product_grid.dart';
import 'package:galeri_lukisan/app/modules/home/widget/product_loading_grid.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widget/search_bar.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.find<HomeController>();

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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.sh,
              ),
              child: Obx(
                () => homeController.isProductLoading.value
                    ? ProductLoadingGrid()
                    : homeController.productList.isNotEmpty
                        ? ProductGrid(products: homeController.productList)
                        : Center(
                            child: Text('Lukisan TIdak Ditemukan'),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
