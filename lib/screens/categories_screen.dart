import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/categories_controllers.dart';
import 'package:flutter_task/helper/constants/colors_resource.dart';
import 'package:flutter_task/helper/constants/dimensions_resource.dart';
import 'package:flutter_task/helper/constants/string_resources.dart';
import 'package:flutter_task/helper/widgets/custom_appbar.dart';
import 'package:flutter_task/routes/routes.dart';
import 'package:get/get.dart';

import '../helper/widgets/custom_bottom_navigation_bar.dart';
import 'product_details_screen.dart';

class CategoriesScreen extends GetView<CategoriesController> {
  const CategoriesScreen({super.key});

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
                return Center(
                    child: CircularProgressIndicator(
                        color: ColorResources.BLACK_COLOR));
              }

              return GridView.builder(
                padding: EdgeInsets.all(DimensionsResource.PADDING_SMALL),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: DimensionsResource.GRID_SPACING,
                  mainAxisSpacing: DimensionsResource.GRID_SPACING,
                  childAspectRatio: 0.8, // Adjust aspect ratio to prevent overflow
                ),
                itemCount: controller.filteredCategories.length,
                itemBuilder: (context, index) {
                  var category = controller.filteredCategories[index];

                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.productDetails, arguments: category);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DimensionsResource.BORDER_RADIUS),
                      ),
                      elevation: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Prevents overflow
                        children: [
                          // Image
                          Container(
                            width: double.infinity,
                            height: DimensionsResource.PRODUCT_IMAGE_HEIGHT,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(DimensionsResource.BORDER_RADIUS),
                              ),
                              image: DecorationImage(
                                image: AssetImage("assets/place_holder.png"), // Placeholder Image
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          SizedBox(height: 10),

                          // Category Name
                          Expanded( // Ensures text fits properly
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: DimensionsResource.PADDING_SMALL),
                              child: Text(
                                category.name,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorResources.BLACK_COLOR,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis, // Prevents overflow text
                              ),
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
