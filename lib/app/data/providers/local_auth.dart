import 'package:galeri_lukisan/app/data/models/user_model2.dart';
import 'package:hive/hive.dart';

class LocalAuth {
  late Box<String> _tokenBox;
  late Box<UserModel> _userBox;

  Future<void> init() async {
    _tokenBox = await Hive.openBox<String>('token');
    _userBox = await Hive.openBox<UserModel>('user');
  }

  Future<void> addToken({required String token}) async {
    await _tokenBox.put('token', token);
  }

  Future<void> addUser({required UserModel user}) async {
    await _userBox.put('user', user);
  }

  Future<void> clear() async {
    await _tokenBox.clear();
    await _userBox.clear();
  }

  String? getToken() => _tokenBox.get('token');
  UserModel? getUser() => _userBox.get('user');
}
