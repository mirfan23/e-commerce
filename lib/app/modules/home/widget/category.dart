import 'package:flutter/material.dart';
import 'package:galeri_lukisan/app/modules/home/widget/category_chip.dart';
import 'package:galeri_lukisan/helper/helpers.dart';

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
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: (BuildContext context, int index) {
          final tema = product[index].tema;
          return CategoryChip(categoryName: tema ?? '-');
          // Padding(
          //   padding: EdgeInsets.all(8),
          //   child: Text(tema ?? ''),
          // );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 2.sh),
      ),
    );
  }
}
