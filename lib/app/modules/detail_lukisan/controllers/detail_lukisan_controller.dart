// ignore_for_file: unnecessary_overrides

import 'package:galeri_lukisan/app/data/models/product_model.dart';
import 'package:galeri_lukisan/app/data/providers/product_provider.dart';
import 'package:get/get.dart';

class DetailLukisanController extends GetxController {
  static DetailLukisanController instance = Get.find();
  // RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  // void getProducts() async {
  //   try {
  //     isProductLoading(true);
  //     var result = await ProductProvider().get();
  //     if (result != null) {
  //       productList.assignAll(productFromJson(str));
  //     }
  //   } finally {
  //     isProductLoading(false);
  //   }
  // }
}
