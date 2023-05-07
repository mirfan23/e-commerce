// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:galeri_lukisan/app/modules/home/controllers/dashboard_controller.dart';
import 'package:galeri_lukisan/app/modules/home/controllers/home_controller.dart';
import 'package:galeri_lukisan/app/modules/home/views/home_view.dart';
import 'package:galeri_lukisan/app/modules/home/views/profile_fragment.dart';
import 'package:get/get.dart';

class DashboardFragment extends StatelessWidget {
  final controller = Get.put(HomeController());

  List<Widget> _fragmentScreen = [
    HomeView(),
    // OrderView(),
    ProfileFragment(),
  ];

  List _navigationButtonsProperties = [
    {
      "active_icon": Icons.home,
      "non_active_icon": Icons.home_outlined,
      "label": "Home",
    },
    // {
    //   "active_icon": FontAwesomeIcons.boxOpen,
    //   "non_active_icon": FontAwesomeIcons.box,
    //   "label": "Order",
    // },
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
              backgroundColor: Color.fromRGBO(54, 105, 201, 0.9),
              currentIndex: _indexNumber.value,
              onTap: (value) {
                _indexNumber.value = value;
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white24,
              items: List.generate(
                2,
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
