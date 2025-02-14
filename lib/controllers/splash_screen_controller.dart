import 'package:flutter_task/helper/constants/string_resources.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  String title = StringResources.MY_STORE;



  @override
  void onInit() {
    super.onInit();
    _initializeSettings();
  }

  Future<void> _initializeSettings() async {
    await Future.delayed(const Duration(seconds: 2));
    if (Get.context != null) {
      Get.offNamed('/product');
    } else {
      print("❌ Navigation failed: Get.context is null");
    }
  }
}
