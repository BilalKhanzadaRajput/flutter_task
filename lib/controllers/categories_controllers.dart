import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../endpoints/api_endpoints.dart';
import '../model/categories_model.dart';

class CategoriesController extends GetxController {
  var isLoading = true.obs;
  var categories = <CategoryModel>[].obs;
  var filteredCategories = <CategoryModel>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);

      final response = await http.get(Uri.parse(ApiEndpoints.categories));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        categories.value =
            data.map((json) => CategoryModel.fromJson(json)).toList();
        filteredCategories.assignAll(categories);
      } else {
        Get.snackbar("Error", "Failed to load categories");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  void searchCategories(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredCategories.assignAll(categories);
    } else {
      filteredCategories.assignAll(
        categories.where((category) => category.name.toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
  }
}
