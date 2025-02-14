import 'package:flutter_task/routes/screen_binding.dart';
import 'package:get/get.dart';
import 'package:flutter_task/screens/splash_screen.dart';
import 'package:flutter_task/screens/product_screen.dart';
import 'package:flutter_task/screens/categories_screen.dart';
import 'package:flutter_task/screens/product_details_screen.dart';
import '../model/categories_model.dart';
import '../screens/favorites_screen.dart';
import '../screens/user_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String product = '/product';
  static const String categories = '/categories';
  static const String productDetails = '/productDetails';
  static const String favoritesScreen = '/favoritesScreen';
  static const String userScreen = '/userScreen';

  static List<GetPage> pages = [
    GetPage(
        name: splash, page: () => SplashScreen(), binding: ScreenBindings()),
    GetPage(
        name: product, page: () => ProductScreen(), binding: ScreenBindings()),
    GetPage(
        name: categories,
        page: () => CategoriesScreen(),
        binding: ScreenBindings()),
    GetPage(
        name: favoritesScreen,
        page: () => FavoritesScreen(),
        binding: ScreenBindings()),
    GetPage(
        name: userScreen, page: () => UserScreen(), binding: ScreenBindings()),
    GetPage(
        name: productDetails,
        page: () => ProductDetailsScreen(),
        binding: ScreenBindings()),
  ];
}
