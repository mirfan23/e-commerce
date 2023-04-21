// import 'package:galeri_lukisan/helper/user_preferences.dart';
// import 'package:get/get.dart';

// import '../app/data/models/user.dart';

// class CurrenUser extends GetxController {
//   final Rx<User> _currentUser = User(
//     id: '',
//     fullName: '',
//     email: '',
//     image: null,
//     birthDay: null,
//   ).obs;

//   User get user => _currentUser.value;

//   getUserInfo() async {
//     User? getUserInfoFromLocalStorage =
//         await RememberUserPreferences.readUserInfo();
//     _currentUser.value = getUserInfoFromLocalStorage!;
//   }
// }
