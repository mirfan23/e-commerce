// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import 'package:belanja/app/modules/detail_lukisan/bindings/detail_lukisan_binding.dart';
import 'package:belanja/app/modules/detail_lukisan/views/detail_lukisan_view.dart';
import 'package:belanja/app/modules/home/bindings/home_binding.dart';
import 'package:belanja/app/modules/home/views/home_view.dart';
import 'package:belanja/app/modules/login/bindings/login_binding.dart';
import 'package:belanja/app/modules/login/views/login_view.dart';
import 'package:belanja/app/modules/register/bindings/register_binding.dart';
import 'package:belanja/app/modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const DETAIL = Routes.DETAIL_LUKISAN;
  static const LOGIN = Routes.LOGIN;
  static const REGISTER = Routes.REGISTER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LUKISAN,
      page: () => DetailLukisanView(),
      binding: DetailLukisanBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
