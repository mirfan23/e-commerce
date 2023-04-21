// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';
// import '../app/data/models/user.dart';

// class RememberUserPreferences {
//   static SharedPreferences? prefs;
//   static Future<void> init() async {
//     prefs = await SharedPreferences.getInstance();
//   }

//   static Future<bool> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setString('token', token);
//   }

//   static Future<String?> readToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('token');
//   }

//   // static Future<bool> saveUserInfo(User user) async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   return prefs.setString('user', json.encode(user.toJson()));
//   // }

//   static Future<User?> readUserInfo() async {
//     final prefs = await SharedPreferences.getInstance();
//     final userString = prefs.getString('user');
//     if (userString != null) {
//       final userData = json.decode(userString);
//       return User.fromJson(userData);
//     }
//     return null;
//   }

//   static Future<void> clear() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
// }
