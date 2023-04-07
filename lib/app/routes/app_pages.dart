import 'package:galeri_lukisan/app/modules/home/views/dashboard_fragment.dart';
import 'package:get/get.dart';

import 'package:galeri_lukisan/app/modules/home/bindings/home_binding.dart';
import 'package:galeri_lukisan/app/modules/home/views/home_view.dart';
import 'package:galeri_lukisan/app/modules/login/bindings/login_binding.dart';
import 'package:galeri_lukisan/app/modules/login/views/signin.dart';
import 'package:galeri_lukisan/app/modules/order/bindings/order_binding.dart';
import 'package:galeri_lukisan/app/modules/order/views/order_view.dart';
import 'package:galeri_lukisan/app/modules/register/bindings/register_binding.dart';
import 'package:galeri_lukisan/app/modules/register/views/signup_view.dart';

import '../modules/home/bindings/dashboard_binding.dart';

// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  // static const DETAIL = Routes.DETAIL_LUKISAN;
  static const LOGIN = Routes.LOGIN;
  static const REGISTER = Routes.REGISTER;
  static const ORDER = Routes.ORDER;
  static const DASHBOARD = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.DETAIL_LUKISAN,
    //   page: () => DetailLukisanView(),
    //   binding: DetailLukisanBinding(),
    // ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => SignUpScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => SignInScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
        name: _Paths.DASHBOARD,
        page: () => DashboardFragment(),
        binding: DashboardBinding()),
  ];
}
