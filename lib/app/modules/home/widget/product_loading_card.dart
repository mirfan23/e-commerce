import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductLoadingCard extends StatelessWidget {
  const ProductLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: Column(
            children: [
              Flexible(
                flex: 5,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 20,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 25,
                      width: 75,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
