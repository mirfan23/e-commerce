// ignore_for_file: unnecessary_overrides

import 'package:galeri_lukisan/app/data/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../helper/const.dart';
import '../../../data/models/productModel2.dart';
import '../../../data/providers/product_provider.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

  final productProvider = Get.put(ProductProvider);
  final products = <Datum>[].obs;
  var isLoading = true.obs;
  var imageUrl = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
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

  void getImagesUrl(String productId) async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    final product = productModelFromJson(response.body);
    imageUrl.value =
        product.data.first.attributes.thumbnails.data.attributes.url;
  }
}
