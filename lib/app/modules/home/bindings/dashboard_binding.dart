import 'package:galeri_lukisan/app/modules/order/controllers/order_controller.dart';
import 'package:get/get.dart';

import '../../register/controllers/auth_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/home_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(AuthController());
    Get.put(OrderController());
  }
}
