import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/categories_controllers.dart';
import 'package:flutter_task/helper/constants/colors_resource.dart';
import 'package:flutter_task/helper/constants/dimensions_resource.dart';
import 'package:flutter_task/helper/constants/string_resources.dart';
import 'package:flutter_task/helper/widgets/custom_appbar.dart';
import 'package:get/get.dart';

import '../helper/widgets/custom_bottom_navigation_bar.dart';
import 'product_details_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesController controller = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: StringResources.CATEGORIES_TITLE),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(DimensionsResource.PADDING_SMALL),
            child: TextField(
              onChanged: (value) => controller.searchCategories(value),
              decoration: InputDecoration(
                hintText: "Search categories...",
                prefixIcon: Icon(Icons.search, color: ColorResources.PRIMARY_COLOR),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(DimensionsResource.BORDER_RADIUS),
                ),
              ),
            ),
          ),

          // Categories List
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator(color: ColorResources.BLACK_COLOR));
              }

              return GridView.builder(
                padding: EdgeInsets.all(DimensionsResource.PADDING_SMALL),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: DimensionsResource.GRID_SPACING,
                  mainAxisSpacing: DimensionsResource.GRID_SPACING,
                  childAspectRatio: 1,
                ),
                itemCount: controller.filteredCategories.length,
                itemBuilder: (context, index) {
                  var category = controller.filteredCategories[index];

                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ProductDetailsScreen(categoryModel: category));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DimensionsResource.BORDER_RADIUS),
                      ),
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Category Image

                          SizedBox(height: 10),

                          // Category Name
                          Text(
                            category.name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorResources.BLACK_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );

            }),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}
