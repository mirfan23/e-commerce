import 'package:flutter/material.dart';
import 'package:galeri_lukisan/app/modules/login/views/login_view.dart';
import 'package:galeri_lukisan/helper/current_user.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
import 'package:galeri_lukisan/helper/user_preferences.dart';
import 'package:get/get.dart';

class ProfileFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.sh),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 2.sh,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/user1.png'),
                ),
              ),
              SizedBox(
                width: 1.sw,
              ),
              Column(
                children: [
                  Text(
                    "Masuk ke Akun Anda",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 5.sh,
          ),
          AccountCard(
              title: "Profile Info",
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginView(),
                  ),
                );
              }),
          AccountCard(title: "Notification", onClick: () {}),
          AccountCard(title: "About Us", onClick: () {}),
          AccountCard(title: "Terms of Services", onClick: () {}),
          AccountCard(title: "Sign In", onClick: () {}),
        ],
      ),
    );
  }

  Widget AccountCard({required String title, required Function() onClick}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          height: 10.sh,
          padding: EdgeInsets.symmetric(horizontal: 2.sh),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 0.1,
                  blurRadius: 7,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_left_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
  // final CurrenUser _currenUser = Get.put(CurrenUser());

  // signOutUser() async {
  //   var resultResponse = await Get.dialog(
  //     AlertDialog(
  //       backgroundColor: Colors.grey,
  //       title: const Text(
  //         "Log Out",
  //         style: TextStyle(
  //           fontSize: 18,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       content: Text("Kamu Yakin akan Logout?"),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Get.back();
  //           },
  //           child: Text(
  //             "No",
  //             style: TextStyle(
  //               color: Colors.black,
  //             ),
  //           ),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Get.back(result: "loggedOut");
  //           },
  //           child: Text(
  //             "Yes",
  //             style: TextStyle(
  //               color: Colors.black,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );

  //   if (resultResponse == "loggedOut") {
  //     RememberUserPreferences.removeUserInfo().then((value) {
  //       Get.off(LoginView());
  //     });
  //   }
  // }

  // Widget userInfoItemProfile(IconData iconData, String userData) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(12),
  //       color: Colors.grey,
  //     ),
  //     padding: const EdgeInsets.symmetric(
  //       horizontal: 16,
  //       vertical: 8,
  //     ),
  //     child: Row(
  //       children: [
  //         Icon(
  //           iconData,
  //           size: 3.sh,
  //           color: Colors.black,
  //         ),
  //         const SizedBox(
  //           width: 16,
  //         ),
  //         Text(
  //           userData,
  //           style: const TextStyle(fontSize: 15),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView(
  //     children: [
  //       Center(
  //         child: Image.asset(
  //           "assets/images/monalisa.jpg",
  //           width: 240,
  //         ),
  //       ),
  //       SizedBox(
  //         height: 2.sh,
  //       ),
  //       userInfoItemProfile(
  //         Icons.person,
  //         _currenUser.user.user_name,
  //       ),
  //       SizedBox(
  //         height: 2.sh,
  //       ),
  //       userInfoItemProfile(
  //         Icons.email,
  //         _currenUser.user.user_email,
  //       ),
  //       SizedBox(
  //         height: 2.sh,
  //       ),
  //       Center(
  //         child: Material(
  //           color: Colors.redAccent,
  //           borderRadius: BorderRadius.circular(8),
  //           child: InkWell(
  //             onTap: () {
  //               signOutUser();
  //             },
  //             borderRadius: BorderRadius.circular(32),
  //             child: Padding(
  //               padding: EdgeInsets.symmetric(
  //                 horizontal: 30,
  //                 vertical: 12,
  //               ),
  //               child: Text(
  //                 "Log Out",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 16,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
