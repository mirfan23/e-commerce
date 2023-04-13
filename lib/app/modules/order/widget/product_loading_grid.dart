import 'package:flutter/material.dart';
import 'package:galeri_lukisan/app/modules/home/widget/product_loading_card.dart';

class OrderLoadingGrid extends StatelessWidget {
  const OrderLoadingGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 6,
      itemBuilder: ((context, index) => ProductLoadingCard()),
    );
  }
}
