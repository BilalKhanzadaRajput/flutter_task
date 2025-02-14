import 'package:flutter_task/controllers/categories_controllers.dart';
import 'package:flutter_task/controllers/favorites_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controllers/product_details_screen_controller.dart';
import '../controllers/product_screen_controller.dart';
import '../controllers/splash_screen_controller.dart';
import '../controllers/user_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => CategoriesController());

    Get.lazyPut(() => ProductController(),tag: "productController");
    Get.lazyPut(() => ProductDetailsScreenController(),tag: "productDetailsScreenController");
    Get.lazyPut(() => FavoritesController());
    Get.lazyPut(() => UserController());
  }
}