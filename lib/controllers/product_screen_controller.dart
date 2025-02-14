import 'package:flutter_task/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../endpoints/api_endpoints.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  var favorites = <ProductModel>[].obs; // Favorites List
  var isLoading = true.obs;
  var searchQuery = ''.obs;
  var favoriteSearchQuery = ''.obs; // Search query for favorite screen

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(ApiEndpoints.products));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        if (jsonData is Map<String, dynamic> && jsonData.containsKey("products") && jsonData["products"] is List) {
          products.value = (jsonData["products"] as List)
              .map((item) => ProductModel.fromJson(item))
              .toList();
        }
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading(false);
    }
  }

  List<ProductModel> get filteredProducts {
    if (searchQuery.value.isEmpty) {
      return products;
    }
    return products
        .where((product) => product.title.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  List<ProductModel> get filteredFavorites {
    if (favoriteSearchQuery.value.isEmpty) {
      return favorites;
    }
    return favorites
        .where((product) => product.title.toLowerCase().contains(favoriteSearchQuery.value.toLowerCase()))
        .toList();
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void updateFavoriteSearchQuery(String query) {
    favoriteSearchQuery.value = query;
  }

  void toggleFavorite(ProductModel product) {
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
  }

  bool isFavorite(ProductModel product) {
    return favorites.contains(product);
  }
}
