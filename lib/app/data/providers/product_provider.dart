import 'dart:convert';

import 'package:galeri_lukisan/app/data/models/product_model.dart';
import 'package:galeri_lukisan/helper/const.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  var client = http.Client();
  // var apiUrl = "$baseUrl/products?populate=thumbnails";

  Future<dynamic> get() async {
    var response = await client.get(
      Uri.parse(
        '$baseUrl/api/products?populate=images',
      ),
    );
    return response;
  }
}
