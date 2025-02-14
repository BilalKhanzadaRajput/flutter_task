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
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: product, page: () => ProductScreen()),
    GetPage(name: categories, page: () => CategoriesScreen()),
    GetPage(name: favoritesScreen, page: () => FavoritesScreen()),
    GetPage(name: userScreen , page: () => UserScreen() ),




    // Pass data using arguments
    GetPage(
      name: productDetails,
      page: () => ProductDetailsScreen(
        categoryModel: Get.arguments as CategoryModel, // Fix here
      ),
    ),
  ];
}
