import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_screen_controller.dart';
import '../helper/constants/colors_resource.dart';
import '../helper/constants/dimensions_resource.dart';
import '../helper/constants/string_resources.dart';
import '../helper/widgets/custom_appbar.dart';
import '../helper/widgets/custom_bottom_navigation_bar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: StringResources.FAVORITES),

      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(DimensionsResource.PADDING_MEDIUM),
            child: TextField(
              onChanged: controller.updateFavoriteSearchQuery,
              decoration: InputDecoration(
                hintText: StringResources.SEARCH_FAVORITES,
                prefixIcon: Icon(Icons.search, color: ColorResources.ICON_COLOR),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(DimensionsResource.BORDER_RADIUS),
                  borderSide: BorderSide(color: ColorResources.BORDER_COLOR),
                ),
                filled: true,
                fillColor: ColorResources.TEXT_FIELD_BACKGROUND,
              ),
            ),
          ),

          // Favorites List
          Expanded(
            child: Obx(() {
              if (controller.filteredFavorites.isEmpty) {
                return Center(
                  child: Text(
                    StringResources.NO_FAVORITES,
                    style: TextStyle(
                      fontSize: DimensionsResource.FONT_SIZE_MEDIUM,
                      color: ColorResources.TEXT_SECONDARY,
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: controller.filteredFavorites.length,
                itemBuilder: (context, index) {
                  var product = controller.filteredFavorites[index];

                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: DimensionsResource.PADDING_MEDIUM,
                      vertical: DimensionsResource.PADDING_SMALL,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DimensionsResource.BORDER_RADIUS),
                      ),
                      elevation: DimensionsResource.CARD_ELEVATION,
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(DimensionsResource.IMAGE_RADIUS),
                          child: Image.network(
                            product.imageUrl,
                            width: DimensionsResource.IMAGE_SIZE_SMALL,
                            height: DimensionsResource.IMAGE_SIZE_SMALL,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          product.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DimensionsResource.FONT_SIZE_MEDIUM,
                            color: ColorResources.BLACK_COLOR,
                          ),
                        ),
                        subtitle: Text(
                          "\$${product.price.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: DimensionsResource.FONT_SIZE_SMALL,
                            color: ColorResources.PRICE_COLOR,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite, color: ColorResources.FAVORITE_COLOR),
                          onPressed: () => controller.toggleFavorite(product),
                        ),
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
