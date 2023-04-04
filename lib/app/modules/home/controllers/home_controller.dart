// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../helper/const.dart';
import '../../../data/models/productModel2.dart';
import '../../../data/providers/product_provider.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getproducts();
  }

  void getproducts() async {
    try {
      isProductLoading(true);
      var result = await ProductProvider().get();
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
        print("+++: ${result.body}");
      }
    } finally {
      isProductLoading(false);
      print(productList.length);
    }
  }

  void getProductByName({required String keyword}) async {
    try {
      isProductLoading(true);
      var result = await ProductProvider().getbyName(keyword: keyword);
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      print(productList.length);
    }
  }

  void getProductByPelukis({required String keyword}) async {
    try {
      isProductLoading(true);
      var result = await ProductProvider().getbyPelukis(keyword: keyword);
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      print(productList.length);
    }
  }
}
