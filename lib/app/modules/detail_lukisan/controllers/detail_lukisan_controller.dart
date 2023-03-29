// ignore_for_file: unnecessary_overrides

import 'package:galeri_lukisan/app/data/models/product_model.dart';
import 'package:galeri_lukisan/app/data/providers/product_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../helper/const.dart';

class DetailLukisanController extends GetxController {
  final productProvider = Get.put(ProductProvider);
  final products = <Datum>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/products?populate=thumbnails'));
      if (response.statusCode == 200) {
        final List<Datum> productData =
            productModelFromJson(response.body).data;
        products.assignAll(productData);
        print("+++: ${response.body}");
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
