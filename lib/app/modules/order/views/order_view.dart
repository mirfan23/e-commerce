import 'package:flutter/material.dart';
import 'package:galeri_lukisan/helper/helpers.dart';

import 'package:get/get.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Orders',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Container(
              height: 10.sh,
              padding: EdgeInsets.symmetric(horizontal: 2.sh),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0.1,
                      blurRadius: 7,
                    )
                  ]),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Image(image: AssetImage('assets/images/monalisa.jpg')),
                  ),
                  SizedBox(
                    width: 4.sh,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Monalisa",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 2.sh,
                      ),
                      Text("Rp. 20.000.000")
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
