import 'package:galeri_lukisan/helper/user_preferences.dart';
import 'package:get/get.dart';

import '../app/data/models/user_Model.dart';

class CurrenUser extends GetxController {
  Rx<User> _currentUser = User(0, '', '', '').obs;

  User get user => _currentUser.value;

  getUserInfo() async {
    User? getUserInfoFromLocalStorage =
        await RememberUserPreferences.readUserInfo();
    _currentUser.value = getUserInfoFromLocalStorage!;
  }
}
