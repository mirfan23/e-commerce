import 'package:flutter/material.dart';
import 'package:galeri_lukisan/app/modules/login/views/login_view.dart';
import 'package:galeri_lukisan/helper/current_user.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:galeri_lukisan/helper/user_preferences.dart';
import 'package:get/get.dart';

class ProfileFragment extends StatelessWidget {
  final CurrenUser _currenUser = Get.put(CurrenUser());

  signOutUser() async {
    var resultResponse = await Get.dialog(
      AlertDialog(
        backgroundColor: Colors.grey,
        title: const Text(
          "Log Out",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text("Kamu Yakin akan Logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "No",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: "loggedOut");
            },
            child: Text(
              "Yes",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );

    if (resultResponse == "loggedOut") {
      RememberUserPreferences.removeUserInfo().then((value) {
        Get.off(LoginView());
      });
    }
  }

  Widget userInfoItemProfile(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 3.sh,
            color: Colors.black,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            userData,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Image.asset(
            "assets/images/monalisa.jpg",
            width: 240,
          ),
        ),
        SizedBox(
          height: 2.sh,
        ),
        userInfoItemProfile(
          Icons.person,
          _currenUser.user.user_name,
        ),
        SizedBox(
          height: 2.sh,
        ),
        userInfoItemProfile(
          Icons.email,
          _currenUser.user.user_email,
        ),
        SizedBox(
          height: 2.sh,
        ),
        Center(
          child: Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () {
                signOutUser();
              },
              borderRadius: BorderRadius.circular(32),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
