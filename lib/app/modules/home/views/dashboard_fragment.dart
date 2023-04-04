// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:galeri_lukisan/app/modules/home/controllers/dashboard_controller.dart';
import 'package:galeri_lukisan/app/modules/home/controllers/home_controller.dart';
import 'package:galeri_lukisan/app/modules/home/views/home_view.dart';
import 'package:galeri_lukisan/app/modules/home/views/order_fragment.dart';
import 'package:galeri_lukisan/app/modules/home/views/profile_fragment.dart';
import 'package:galeri_lukisan/helper/current_user.dart';
import 'package:get/get.dart';

class DashboardFragment extends StatelessWidget {
  final controller = Get.put(HomeController());
  // CurrenUser rememberCurrentUser = Get.put(CurrenUser());

  List<Widget> _fragmentScreen = [
    HomeView(),
    OrderFragment(),
    ProfileFragment(),
  ];

  List _navigationButtonsProperties = [
    {
      "active_icon": Icons.home,
      "non_active_icon": Icons.home_outlined,
      "label": "Home",
    },
    {
      "active_icon": FontAwesomeIcons.boxOpen,
      "non_active_icon": FontAwesomeIcons.box,
      "label": "Order",
    },
    {
      "active_icon": Icons.person,
      "non_active_icon": Icons.person_outline,
      "label": "Profile",
    }
  ];

  RxInt _indexNumber = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Obx(
              () => _fragmentScreen[_indexNumber.value],
            ),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              backgroundColor: Colors.black,
              currentIndex: _indexNumber.value,
              onTap: (value) {
                _indexNumber.value = value;
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white24,
              items: List.generate(
                3,
                (index) {
                  var navButtonProperty = _navigationButtonsProperties[index];
                  return BottomNavigationBarItem(
                      icon: Icon(navButtonProperty["non_active_icon"]),
                      activeIcon: Icon(navButtonProperty["active_icon"]),
                      label: navButtonProperty["label"]);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
