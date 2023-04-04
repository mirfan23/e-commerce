import 'dart:convert';

import 'package:galeri_lukisan/helper/const.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  var client = http.Client();
  var apiUrl = "$baseUrl/api/products";

  Future<dynamic> get() async {
    var response = await client.get(
      Uri.parse(
        '$apiUrl?populate=images',
      ),
    );
    return response;
  }

  Future<dynamic> getbyName({required String keyword}) async {
    var response = await client.get(
      Uri.parse(
        '$apiUrl?populate=images&filters[name][\$contains]=$keyword',
      ),
    );
    return response;
  }

  Future<dynamic> getbyPelukis({required String keyword}) async {
    var response = await client.get(
      Uri.parse(
        '$apiUrl?populate=images&filters[pelukis][\$contains]=$keyword',
      ),
    );
    return response;
  }
}
