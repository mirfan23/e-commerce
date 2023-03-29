import 'package:cached_network_image/cached_network_image.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:galeri_lukisan/helper/widget_extension.dart';
import 'package:get/get.dart';
import '../../../../helper/const.dart';
import '../../../data/models/product_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../widget/search_bar.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.find<HomeController>();

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
            Obx(
              () => Container(
                padding: EdgeInsets.only(right: 3.sh, left: 3.sh),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.sh,
                    mainAxisSpacing: 2.sh,
                  ),
                  itemCount: controller.products.length,
                  itemBuilder: ((context, index) {
                    Datum product = homeController.products[index];
                    return Column(
                      children: [
                        // CachedNetworkImage(
                        //   imageUrl:
                        //       // model.data[index].attributes.thumbnails.data.attributes.url,
                        //       // homeController.imageUrl.value,
                        //       '${'$baseUrl/products?populate=thumbnails'}${product.attributes.thumbnails.data.attributes.formats.thumbnail.url}',
                        //   width: 19.sw,
                        //   errorWidget: (context, url, error) =>
                        //       Text('Error: $error'),
                        //   placeholder: (context, url) =>
                        //       CircularProgressIndicator(),
                        // ),
                        SizedBox(
                          height: 1.sh,
                        ),
                        Text(
                          product.attributes.title,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
