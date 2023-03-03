import 'package:get/get.dart';

import '../controllers/detail_lukisan_controller.dart';

class DetailLukisanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLukisanController>(
      () => DetailLukisanController(),
    );
  }
}
