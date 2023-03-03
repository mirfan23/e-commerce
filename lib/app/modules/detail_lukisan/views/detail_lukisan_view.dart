import 'package:belanja/helper/helpers.dart';
import 'package:belanja/helper/list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/detail_lukisan_controller.dart';

class DetailLukisanView extends GetView<DetailLukisanController> {
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
                    // alignment: Alignment.center,
                    // color: Colors.amber,
                    height: 50.sh,
                    width: 75.sw,
                    child: CarouselSlider.builder(
                      itemCount: MyList.film.length,
                      itemBuilder: (_, index, ___) {
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
                    // color: Colors.black,
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
              // height: 50.sh,
              width: 50.sh,
              // color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Warna"),
                  Container(
                    height: 30.sh,
                    color: Colors.amber,
                  ),
                  Text("Pelukis"),
                  Container(
                    height: 30.sh,
                    color: Colors.amber,
                  ),
                  Text("Deskripsi"),
                  Container(
                    height: 30.sh,
                    color: Colors.amber,
                  ),
                  // Text("data"),
                ],
              ),
            ),
            SizedBox(
              height: 2.sh,
            )
          ],
        ),
      ),
    );
  }
}
