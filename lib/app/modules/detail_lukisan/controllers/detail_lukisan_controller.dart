// ignore_for_file: unnecessary_overrides

import 'package:galeri_lukisan/app/data/providers/product_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../helper/const.dart';

class DetailLukisanController extends GetxController {
  final productProvider = Get.put(ProductProvider);
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
