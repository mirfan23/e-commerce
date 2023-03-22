// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:galeri_lukisan/app/data/models/product_model.dart';
import 'package:galeri_lukisan/app/data/providers/product_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
// with StateMixin<ProductModel> {

  var isLoading = true.obs;
  var productData = [].obs;
  var errorMessage = "".obs;

  // var productProvider = Get.put(ProductProvider());
  late final ProductModel dataModel;
  late final int index;

  // List<Lukisan> lukisan = [
  //   // String title,
  // // String description,
  // // int price,
  // // String pelukis,
  // // Images images,
  // ];

  // var title = dataModel.data[index].attributes.title;
  // var description;
  // var price;
  // var pelukis;
  // var images;

  // bool isLoading = false;

  // Future<void> refreshData() async {
  //   // isLoading = true;
  //   // update();

  //   final result = await ProductProvider().
  //   // getAll();
  //   conncectAPI(
  //     String title,
  // String description,
  // int price,
  // String pelukis,
  // Images images,
  //   );
  //   lukisan = result.data;

  // isLoading = false;
  // update();

  // try {
  //   productProvider.fetchProduct().then((value) {
  //     katalogProduct = ProductModel(data: value.data, meta: value.meta,);
  //   })
  // }
  // }

  // void getProduct() {
  //   try {
  //     productProvider.fetchProduct()
  //   }
  // }

  void fetchProduct() async {
    try {
      isLoading(true);
      var response = await ProductProvider().getData();
      if (response.statusCode == 200) {
        productData.assignAll(json.decode(response.body));
      } else {
        errorMessage("Error");
      }
    } finally {
      isLoading(false);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchProduct();
    // refreshData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
