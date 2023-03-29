// ignore_for_file: depend_on_referenced_packages

import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:galeri_lukisan/helper/list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/product_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/detail_lukisan_controller.dart';

class DetailLukisanView extends GetView<DetailLukisanController> {
  final DetailLukisanController detailController =
      Get.find<DetailLukisanController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Detail Product',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          splashRadius: 3.sh,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 3.sh,
            color: Colors.black,
          ),
          onPressed: () {
            Get.toNamed(AppPages.INITIAL);
          },
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2.sh,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 50,
                  right: 50,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 50.sh,
                      width: 75.sw,
                      child: CarouselSlider.builder(
                        itemCount: MyList.film.length,
                        itemBuilder: (_, index, ___) {
                          Datum detail = detailController.products[index];
                          return Container(
                            child: Image(
                              image: MyList.film[index],
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 300,
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                        ),
                      ),
                    ),
                    Container(
                      height: 50.sh,
                      alignment: Alignment.bottomLeft,
                      child: Text("1/6"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.sh,
              ),
              Container(
                width: 50.sh,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pelukis"),
                    Container(
                        height: 30.sh,
                        // color: Colors.amber,
                        child: Text(
                            detailController.products.first.attributes.pelukis)
                        // ListView.builder(
                        //   itemCount: controller.products.length,
                        //   itemBuilder: (context, index) {
                        //     return Text(
                        //         controller.products[index].attributes.pelukis);
                        //   },
                        // ),
                        ),
                    Text("Tema"),
                    Container(
                        height: 30.sh,
                        // color: Colors.amber,
                        child: Text(detailController
                            .products.first.attributes.categories)
                        // ListView.builder(
                        //   itemCount: controller.products.length,
                        //   itemBuilder: (context, index) {
                        //     return Text(
                        //         controller.products[index].attributes.categories);
                        //   },
                        // ),
                        ),
                    Text("Warna"),
                    Container(
                        height: 30.sh,
                        // color: Colors.amber,
                        child: Text(
                            detailController.products.first.attributes.colors)
                        // ListView.builder(
                        //   itemCount: controller.products.length,
                        //   itemBuilder: (context, index) {
                        //     return Text(
                        //         controller.products[index].attributes.colors);
                        //   },
                        // ),
                        ),
                    Text("Deskripsi"),
                    Container(
                        height: 30.sh,
                        // color: Colors.amber,
                        child: Text(detailController
                            .products.first.attributes.description)
                        // ListView.builder(
                        //   itemCount: controller.products.length,
                        //   itemBuilder: (context, index) {
                        //     return Text(controller
                        //         .products[index].attributes.description);
                        //   },
                        // ),
                        ),
                    Text("Ukuran"),
                    Container(
                      height: 30.sh,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.sh,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(
          2.sh,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Hubungi Admin"),
            ),
            SizedBox(
              width: 2.sh,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppPages.ORDER);
              },
              child: Text("Beli"),
            ),
          ],
        ),
      ),
    );
  }
}
