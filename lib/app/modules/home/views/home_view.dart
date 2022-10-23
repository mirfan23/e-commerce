import 'package:belanja/helper/list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: Text(
          'Mega Mall',
          style: TextStyle(
            color: Colors.blue[400],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
            ),
            onPressed: null,
          ),
          InkWell(
            onTap: null,
            child: Image(
              image: AssetImage(
                "assets/icons/cart.png",
              ),
              height: 20,
              width: 20,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              // color: Colors.amber,
              padding: EdgeInsets.all(10),
              height: 60,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      width: 5,
                    ),
                  ),
                  hintText: "Search Product Name",
                  hintTextDirection: TextDirection.ltr,
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: CarouselSlider.builder(
                itemCount: MyList.voucher.length,
                itemBuilder: (_, index, __) {
                  return carditem(MyList.voucher, index);
                },
                options: CarouselOptions(
                  height: 145,
                  viewportFraction: 0.8,
                  autoPlay: true,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Text("Categories"),
                  Spacer(),
                  Text("see all"),
                ],
              ),
            ),
            ListView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  child: Row(children: [
                    Image(image: AssetImage("assets/icons/icon_foods.png")),
                    Text(""),
                  ]),
                ),
                Container(
                  child: Row(children: [
                    Image(image: AssetImage("assets/icons/icon_gift.png")),
                    Text("Foods"),
                  ]),
                ),
                Container(
                  child: Row(children: [
                    Image(image: AssetImage("assets/icons/icon_fashion.png")),
                    Text("Fashion"),
                  ]),
                ),
                Container(
                  child: Row(children: [
                    Image(image: AssetImage("assets/icons/icon_gadget.png")),
                    Text("Gadget"),
                  ]),
                ),
                Container(
                  child: Row(children: [
                    Image(image: AssetImage("assets/icons/icon_compute.png")),
                    Text("Compute"),
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget carditem(List data, int index) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Image(
      image: data[index],
      width: double.infinity,
      fit: BoxFit.cover,
    ),
  );
}
