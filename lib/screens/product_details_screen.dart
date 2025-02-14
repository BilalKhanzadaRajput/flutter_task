import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_details_screen_controller.dart';
import '../helper/constants/colors_resource.dart';
import '../helper/constants/dimensions_resource.dart';
import '../helper/constants/string_resources.dart';
import '../helper/widgets/custom_appbar.dart';
import '../helper/widgets/custom_bottom_navigation_bar.dart';
import '../model/categories_model.dart';
import '../model/categories_details_model.dart';

class ProductDetailsScreen extends GetView<ProductDetailsScreenController> {
  const ProductDetailsScreen({
    super.key,
  });
  @override
  final String tag = "productDetailsScreenController";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: StringResources.PRODUCT_DETAILS),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child:
                  CircularProgressIndicator(color: ColorResources.BLACK_COLOR),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(DimensionsResource.PADDING_MEDIUM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Details Section
                  for (ProductDetailsModel product in controller.categories)
                    Column(
                      children: [
                        Image.network(product.thumbnail),
                        SizedBox(height: DimensionsResource.SPACING_SMALL),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildDetailRow(
                                StringResources.NAME, product.title),
                            IconButton(
                              icon: Obx(() => Icon(
                                    controller.isFavorite(product)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: ColorResources.FAVORITE_COLOR,
                                  )),
                              onPressed: () {
                                controller.toggleFavorite(product);
                              },
                            ),
                          ],
                        ),
                        _buildDetailRow(
                            StringResources.PRICE, product.price.toString()),
                        _buildDetailRow(
                            StringResources.CATEGORY, product.category),
                        _buildDetailRow(StringResources.BRAND, product.brand),
                        Row(
                          children: [
                            Text(
                              StringResources.RATING,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorResources.TEXT_SECONDARY,
                              ),
                            ),
                            SizedBox(width: DimensionsResource.SPACING_SMALL),
                            Row(
                              children: product.reviews
                                  .map((i) => Icon(
                                        i.rating < 4
                                            ? Icons.star
                                            : Icons.star_half,
                                        color: ColorResources.RATING_COLOR,
                                        size: DimensionsResource.ICON_SIZE,
                                      ))
                                  .toList(),
                            ),
                            Text(product.rating.toString()),
                          ],
                        ),
                        _buildDetailRow(StringResources.STOCK, '46'),
                        SizedBox(height: DimensionsResource.SPACING_MEDIUM),
                        Text(
                          StringResources.DESCRIPTION,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorResources.TEXT_SECONDARY,
                          ),
                        ),
                        SizedBox(height: DimensionsResource.SPACING_SMALL),
                        Text(
                          product.description,
                          style: TextStyle(
                            color: ColorResources.BLACK_COLOR,
                          ),
                        ),
                        SizedBox(height: DimensionsResource.SPACING_MEDIUM),
                        Text(
                          StringResources.PRODUCT_GALLERY,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorResources.TEXT_SECONDARY,
                          ),
                        ),
                        SizedBox(height: DimensionsResource.SPACING_SMALL),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: DimensionsResource.GRID_SPACING,
                            mainAxisSpacing: DimensionsResource.GRID_SPACING,
                          ),
                          itemCount: product.images.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    DimensionsResource.BORDER_RADIUS),
                                color: ColorResources.PRIMARY_COLOR,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    DimensionsResource.BORDER_RADIUS),
                                child: Image.network(
                                  product.images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 0),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: DimensionsResource.SPACING_EXTRA_SMALL),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorResources.TEXT_SECONDARY,
            ),
          ),
          SizedBox(width: DimensionsResource.SPACING_SMALL),
          Text(
            value,
            style: TextStyle(color: ColorResources.BLACK_COLOR),
          ),
        ],
      ),
    );
  }
}
