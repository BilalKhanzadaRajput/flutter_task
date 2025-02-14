import 'dart:convert';
import 'dart:developer';

import 'package:flutter_task/model/categories_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/categories_details_model.dart';

class ProductDetailsScreenController extends GetxController {
  var isLoading = true.obs;
  var categories = <ProductDetailsModel>[].obs;

  var favorites = <ProductDetailsModel>[].obs;
  var favoriteSearchQuery = ''.obs;




  List<ProductDetailsModel> get filteredFavorites {
    if (favoriteSearchQuery.value.isEmpty) {
      return favorites;
    }
    return favorites
        .where((product) => product.title
            .toLowerCase()
            .contains(favoriteSearchQuery.value.toLowerCase()))
        .toList();
  }

  void updateFavoriteSearchQuery(String query) {
    favoriteSearchQuery.value = query;
  }

  void toggleFavorite(ProductDetailsModel product) {
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
  }

  bool isFavorite(ProductDetailsModel product) {
    return favorites.contains(product);
  }

  Future<void> fetchCategories(String url) async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url));
      log(url);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['products'];
        log(data.toString());
        categories.value =
            data.map((json) => ProductDetailsModel.fromJson(json)).toList();

        log(categories.toString());
      } else {
        Get.snackbar("Error", "Failed to load categories");
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    CategoryModel categoryModel = Get.arguments  ?? CategoryModel.empty();
    fetchCategories(categoryModel.url);
  }
}
