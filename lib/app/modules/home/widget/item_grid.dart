import 'package:belanja/helper/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/list.dart';
import '../../../routes/app_pages.dart';

class ItemGrid extends StatelessWidget {
  const ItemGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      padding: EdgeInsets.only(right: 3.sh, left: 3.sh),
      // height: 200.sh,
      child: GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.sh,
          mainAxisSpacing: 2.sh,
        ),
        itemCount: MyList.film.length,
        itemBuilder: ((__, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(5.sh),
            onTap: (() {
              Get.toNamed(AppPages.DETAIL);
            }),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 1,
                        // offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(2.sh),
                  ),
                ),
                Container(
                  height: 25.sh,
                  width: 25.sh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.sh),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(1.5.sh),
                  child: Column(
                    children: [
                      Image(
                        image: MyList.film[index],
                        width: 20.sw,
                      ),
                      SizedBox(
                        height: 1.sh,
                      ),
                      Text(
                        MyList.NamaFilm[index],
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
