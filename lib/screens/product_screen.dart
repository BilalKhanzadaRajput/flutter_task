import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/product_screen_controller.dart';
import 'package:flutter_task/helper/constants/colors_resource.dart';
import 'package:flutter_task/helper/constants/dimensions_resource.dart';
import 'package:flutter_task/helper/constants/string_resources.dart';
import 'package:flutter_task/helper/widgets/custom_appbar.dart';
import 'package:flutter_task/helper/widgets/custom_bottom_navigation_bar.dart';
import 'package:get/get.dart';

class ProductScreen extends GetView<ProductController>{

   const ProductScreen({super.key});
  @override
  final String tag = "productController";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: StringResources.PRODUCT_TITLE),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(DimensionsResource.PADDING_SMALL),
            child: TextField(
              onChanged: controller.updateSearchQuery,
              decoration: InputDecoration(
                hintText: StringResources.SEARCH_HINT,
                prefixIcon: Icon(Icons.search, color: ColorResources.ICON_COLOR),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(DimensionsResource.BORDER_RADIUS),
                  borderSide: BorderSide(color: ColorResources.PRIMARY_COLOR),
                ),
                filled: true,
                fillColor: ColorResources.PRIMARY_COLOR,
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator(color: ColorResources.BLACK_COLOR));
              }
              if (controller.filteredProducts.isEmpty) {
                return Center(child: Text(StringResources.NO_PRODUCTS_FOUND));
              }
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: DimensionsResource.PADDING_SIZE_SMALL),
                itemCount: controller.filteredProducts.length,
                itemBuilder: (context, index) {
                  var product = controller.filteredProducts[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: DimensionsResource.PADDING_SIZE_SMALL),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DimensionsResource.BORDER_RADIUS),
                      ),
                      elevation: DimensionsResource.CARD_ELEVATION,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(DimensionsResource.BORDER_RADIUS),
                            ),
                            child: Image.network(
                              product.imageUrl,
                              width: double.infinity,
                              height: DimensionsResource.PRODUCT_IMAGE_HEIGHT,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(DimensionsResource.PADDING_SMALL),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                SizedBox(height: DimensionsResource.SPACE_EXTRA_SMALL),
                                Row(
                                  children: List.generate(5, (i) {
                                    return Icon(
                                      Icons.star,
                                      color: i < product.rating ? ColorResources.RATING_COLOR : ColorResources.UNSELECTED_STAR,
                                      size: DimensionsResource.ICON_SIZE_SMALL,
                                    );
                                  }),
                                ),
                                SizedBox(height: DimensionsResource.SPACE_EXTRA_SMALL),
                                Text(
                                  "${StringResources.BY} ${product.brand}",
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ColorResources.TEXT_SECONDARY,
                                  ),
                                ),
                                SizedBox(height: DimensionsResource.SPACE_EXTRA_SMALL),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${product.price.toStringAsFixed(2)}',
                                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Obx(() => Icon(
                                        controller.isFavorite(product) ? Icons.favorite : Icons.favorite_border,
                                        color: ColorResources.FAVORITE_COLOR,
                                      )),
                                      onPressed: () {
                                        controller.toggleFavorite(product);
                                      },
                                    ),
                                  ],
                                ),
                              ],
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
