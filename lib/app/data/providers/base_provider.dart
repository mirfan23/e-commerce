import 'package:galeri_lukisan/helper/const.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    // var token = readToken();

    httpClient.baseUrl = baseUrl;
    httpClient.addRequestModifier<void>((request) {
      // request.headers['Accept'] = 'application/json';
      // request.headers['Token'] = token;
      return request;
    });

    super.onInit();
  }
}
