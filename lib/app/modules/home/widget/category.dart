import 'package:flutter/material.dart';
import 'package:galeri_lukisan/app/modules/home/widget/category_chip.dart';
import 'package:galeri_lukisan/helper/helpers.dart';

import '../../../../helper/list.dart';
import '../../../data/models/product.dart';

class Category extends StatelessWidget {
  final List<Product> product;
  const Category({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.sh,
      child: ListView.separated(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: MyList.Kategori.length,
        itemBuilder: (BuildContext context, int index) {
          final category = MyList.Kategori[index];
          return CategoryChip(
            categoryName: category.categoryName,
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 2.sh),
      ),
    );
  }
}
