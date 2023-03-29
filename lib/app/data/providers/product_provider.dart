import 'dart:convert';

import 'package:galeri_lukisan/app/data/models/product_model.dart';
import 'package:galeri_lukisan/helper/const.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  var apiUrl = "$baseUrl/products?populate=thumbnails";

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final json = response.body;
      final list = (jsonDecode(json)['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      return list;
    } else {
      throw Exception("Failed to load products");
    }
  }
}
