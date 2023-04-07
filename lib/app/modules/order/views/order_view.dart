import 'package:flutter/material.dart';
import 'package:galeri_lukisan/app/modules/home/views/dashboard_fragment.dart';
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
        leading: IconButton(
          splashRadius: 3.sh,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 3.sh,
            color: Colors.black,
          ),
          onPressed: () {
            Get.to(() => DashboardFragment());
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                color: Colors.black,
                width: 50.sh,
                height: 50.sh,
              ),
              Container(
                color: Colors.amber,
                width: 50.sh,
                height: 50.sh,
              ),
              Container(
                color: Colors.black,
                width: 50.sh,
                height: 50.sh,
              ),
              Container(
                color: Colors.amber,
                width: 50.sh,
                height: 50.sh,
              ),
              Container(
                color: Colors.black,
                width: 50.sh,
                height: 50.sh,
              ),
              Container(
                color: Colors.amber,
                width: 50.sh,
                height: 50.sh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
