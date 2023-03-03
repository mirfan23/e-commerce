import 'package:belanja/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterView'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppPages.LOGIN);
              },
              child: Container(
                child: Text("data"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
