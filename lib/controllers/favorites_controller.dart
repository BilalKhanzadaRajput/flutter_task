import 'package:flutter_task/controllers/product_details_screen_controller.dart';
import 'package:flutter_task/controllers/product_screen_controller.dart';
import 'package:flutter_task/model/categories_details_model.dart';
import 'package:flutter_task/model/favorites_product_model.dart';
import 'package:flutter_task/model/product_model.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  var favoriteProducts = <FavoritesProductModel>[].obs;
  ProductController productController = Get.find(tag: "productController");
  ProductDetailsScreenController productDetailsScreenController =
      Get.find(tag: "productDetailsScreenController");

  void toggleFavorite(FavoritesProductModel product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }
  }

  bool isFavorite(FavoritesProductModel product) {
    return favoriteProducts.contains(product);
  }

  @override
  void onInit() {
    super.onInit();
    List<ProductModel> productModel = List.empty();
    List<ProductDetailsModel> productDetailsModel = List.empty();
    productModel = productController.favorites.value;
    productDetailsModel = productDetailsScreenController.favorites.value;

    for (ProductModel p in productModel) {
      favoriteProducts.add(FavoritesProductModel(
          id: p.id,
          title: p.title,
          price: p.price,
          brand: p.brand,
          rating: p.rating,
          imageUrl: p.imageUrl));
    }

    for (ProductDetailsModel p in productDetailsModel) {
      favoriteProducts.add(FavoritesProductModel(
          id: p.id,
          title: p.title,
          price: p.price,
          brand: p.brand,
          rating: p.rating,
          imageUrl: p.thumbnail));
    }
  }
}
