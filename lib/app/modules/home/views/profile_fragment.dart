import 'package:flutter/material.dart';
import 'package:galeri_lukisan/app/modules/login/views/login_view.dart';
import 'package:galeri_lukisan/helper/controllers.dart';
import 'package:galeri_lukisan/helper/helpers.dart';
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
          Obx(
            () => Row(
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
                      authController.user.value?.fullName ??
                          "Masuk Kedalam Akun Anda",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )
              ],
            ),
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
                    builder: (context) => SignInScreen(),
                  ),
                );
              }),
          Obx(
            () => AccountCard(
                title:
                    authController.user.value == null ? "Sign In" : "Sign Out",
                onClick: () {
                  if (authController.user.value != null) {
                    authController.signOut();
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  }
                }),
          )
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
}
