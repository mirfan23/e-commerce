// ignore_for_file: depend_on_referenced_packages

import 'package:galeri_lukisan/app/data/models/product.dart';
import 'package:galeri_lukisan/app/modules/home/widget/product_card.dart';
import 'package:flutter/material.dart';

class OrderGrid extends StatelessWidget {
  final List<Product> products;
  const OrderGrid({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: ((context, index) => ProductCard(
            product: products[index],
          )),
    );
  }
}
