// ignore_for_file: depend_on_referenced_packages

import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../widget/item_grid.dart';
import '../widget/search_bar.dart';

class HomeView extends GetView<HomeController> {
  late final ProductModel model;
  late final int index;

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Galeri Lukisan',
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(AppPages.REGISTER);
              },
              child: Container(
                padding: EdgeInsets.all(2.sh),
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 2.sh,
                    ),
                    Text("Log Out"),
                  ],
                ),
              ),
            ),
          ],
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

            Obx(() => homeController.isLoading.value
                ? CircularProgressIndicator()
                : Container()),
            Obx(() => homeController.errorMessage.value != ""
                ? Text(homeController.errorMessage.value)
                : Container()),
            Obx(() => ItemGrid(model: model, index: index)),

            // controller.obx(
            //   (data) => ItemGrid(
            //     index: index,
            //     model: model,
            //   ),
            // )
            // Container(
            //   padding: EdgeInsets.only(right: 3.sh, left: 3.sh),
            //   child: GridView.builder(
            //     shrinkWrap: true,
            //     physics: ScrollPhysics(),
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 2.sh,
            //       mainAxisSpacing: 2.sh,
            //     ),
            //     itemCount: model.data.length,
            //     itemBuilder: ((__, index) {
            //       return Column(
            //         children: [
            //           Image(
            //             image: model.data[index].attributes.images
            //                 as ImageProvider,
            //             width: 19.sw,
            //           ),
            //           SizedBox(
            //             height: 1.sh,
            //           ),
            //           Text(
            //             model.data[index].attributes.title,
            //             style: TextStyle(fontSize: 12, color: Colors.black),
            //             overflow: TextOverflow.ellipsis,
            //           )
            //         ],
            //       ).margin(all: 2.sh).button(
            //             elevation: 3,
            //             onPressed: () {
            //               Get.toNamed(AppPages.DETAIL);
            //             },
            //           );
            //     }),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
