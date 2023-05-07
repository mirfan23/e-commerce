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

  Future<dynamic> getbyFilter({required String keyword}) async {
    var response = await client.get(
      Uri.parse(
        '$apiUrl?populate=images&[filters][\$or][0][pelukis][\$contains]=$keyword&[filters][\$or][1][name][\$contains]=$keyword&[filters][\$or][2][tema][\$contains]=$keyword',
      ),
    );
    return response;
  }
}
