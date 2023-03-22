import 'dart:convert';
import 'package:galeri_lukisan/helper/const.dart';
import 'package:http/http.dart' as http;

class RegisterProvider {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  conncectAPI(
    String username,
    String email,
    String password,
    int phone,
  ) async {
    Uri url = Uri.parse("$baseUrl/api/auth/local");

    var hasilResponse = await http.post(
      url,
      body: {
        "username": username,
        "email": email,
        "password": password,
        "phone": phone,
      },
    );

    _data = json.decode(hasilResponse.body);
  }

  // String username, email, password;
  // int phone;

  // UserProvider({required this.username,required this.email, required this.password, required this.phone,})

  // conncectAPI(String username, String password) {
  //   Uri url = Uri.parse("$baseUrl/api/auth/local");

  //   http.post(url, body:  );
  // }
}
