import 'package:flutter/material.dart';
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
                width: 3.sw,
              ),
              Column(
                children: [
                  Obx(
                    () => Text(
                      authController.user.value?.fullName ?? "USER",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 5.sh,
          ),
          accountCard(
              title: "Sign Out",
              onClick: () {
                authController.signOut();
              }),
        ],
      ),
    );
  }

  Widget accountCard({required String title, required Function() onClick}) {
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
