import 'package:belanja/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/list.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class Lukisan extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 400,
        child: InkWell(
          onTap: () => AppPages.DETAIL,
          child: Container(
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
              ),
              itemBuilder: ((context, index) {
                return Container(
                  height: 5.sh,
                  child: Column(
                    children: List.generate(
                      MyList.film.length,
                      (index) => InkWell(
                        onTap: () => Get.toNamed(AppPages.DETAIL),
                        child: Column(
                          children: [
                            Container(
                              height: 20.sh,
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Image(
                                image: MyList.film[index],
                              ),
                            ),
                            SizedBox(
                              height: 2.sh,
                            ),
                            Text("data")
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
