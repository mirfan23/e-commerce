// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import '../../../data/models/product.dart';
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

  void getProductFilter({required String keyword}) async {
    try {
      isProductLoading(true);
      var result = await ProductProvider().getbyFilter(keyword: keyword);
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      print(productList.length);
    }
  }

  void refreshHomeView() {
    // Masukkan logika untuk memperbarui data di HomeView di sini
    // Contoh:
    getproducts(); // Misalnya, memanggil method getProductList untuk mendapatkan daftar produk terbaru
  }
}
