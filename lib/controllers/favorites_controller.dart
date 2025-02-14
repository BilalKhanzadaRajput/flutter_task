import 'package:flutter_task/model/categories_details_model.dart';
import 'package:flutter_task/model/product_model.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  var favoriteProducts = <ProductModel>[].obs;
  var favoriteProductsDetailsitems = <ProductDetailsModel>[].obs;


  void toggleFavorite(ProductModel product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }
  }


  bool isFavorite(ProductModel product) {
    return favoriteProducts.contains(product);
  }
}
