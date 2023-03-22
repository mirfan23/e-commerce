import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:galeri_lukisan/app/data/models/product_model.dart';
import 'package:galeri_lukisan/helper/const.dart';
import 'package:http/http.dart' as http;

import 'base_provider.dart';

class ProductProvider extends BaseProvider {
  // late Dio _dio;

  // ProductProvider() {
  //   _dio = Dio(
  //     BaseOptions(
  //       baseUrl: baseUrl,
  //       responseType: ResponseType.json,
  //       headers: {"Content-Type": "application/json"},
  //     ),
  //   );
  // }

  // Future<ProductModel> getAll() async {
  //   final response = await _dio.get(
  //     "/api/products?populate=images",
  //   );
  //   return ProductModel.fromJson(response.data);
  // }

  // Map<String, dynamic> _data = {};

  // Map<String, dynamic> get data => _data;

  // int get jumlahData => _data.length;

  // conncectAPI(
  //   String title,
  //   String description,
  //   String pelukis,
  //   Images images,
  //   int price,
  // ) async {
  //   Uri url = Uri.parse("$baseUrl/api/products?populate=images");

  //   var hasilResponse = await http.post(
  //     url,
  //     body: {
  //       "title": title,
  //       "description": description,
  //       "pelukis": pelukis,
  //       "images": images,
  //       "harga": price,
  //     },
  //   );

  //   _data = json.decode(hasilResponse.body);
  // }

  var client = http.Client();
  final String url = '$baseUrl/api/products';

  Future<http.Response> getData() async {
    var response = await client.get(
      Uri.parse('$url?populate=images'),
    );

    return response;
  }
}
