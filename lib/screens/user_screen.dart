import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../helper/constants/colors_resource.dart';
import '../helper/constants/dimensions_resource.dart';
import '../helper/constants/string_resources.dart';
import '../helper/widgets/custom_bottom_navigation_bar.dart';


class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: DimensionsResource.PADDING_MEDIUM,
          vertical: DimensionsResource.PADDING_LARGE,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                StringResources.ACCOUNT,
                style: TextStyle(
                  fontSize: DimensionsResource.FONT_SIZE_EXTRA_LARGE,
                  fontWeight: FontWeight.bold,
                  color: ColorResources.TEXT_PRIMARY,
                ),
              ),
            ),
            const SizedBox(height: DimensionsResource.SPACING_MEDIUM),

            // Profile Card
            Container(
              padding: const EdgeInsets.all(DimensionsResource.PADDING_MEDIUM),
              decoration: BoxDecoration(
                color: ColorResources.BLACK_COLOR,
                borderRadius: BorderRadius.circular(DimensionsResource.BORDER_RADIUS),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: DimensionsResource.IMAGE_SIZE_SMALL / 2,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: DimensionsResource.ICON_SIZE_LARGE, color: Colors.black),
                  ),
                  const SizedBox(width: DimensionsResource.SPACING_SMALL),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text(
                        controller.userName.value,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: DimensionsResource.FONT_SIZE_MEDIUM,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      Obx(() => Text(
                        controller.email.value,
                        style: TextStyle(color: Colors.white, fontSize: DimensionsResource.FONT_SIZE_SMALL),
                      )),
                      Obx(() => Text(
                        controller.phoneNumber.value,
                        style: TextStyle(color: Colors.white, fontSize: DimensionsResource.FONT_SIZE_SMALL),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: DimensionsResource.SPACING_MEDIUM),

            // Account Options List
            ListTile(
              leading: Icon(Icons.settings, size: DimensionsResource.ICON_SIZE_MEDIUM),
              title: Text(StringResources.ACCOUNT_SETTINGS, style: TextStyle(fontSize: DimensionsResource.FONT_SIZE_MEDIUM)),
              onTap: () {}, // Add functionality
            ),
            ListTile(
              leading: Icon(Icons.credit_card, size: DimensionsResource.ICON_SIZE_MEDIUM),
              title: Text(StringResources.PAYMENT_METHODS, style: TextStyle(fontSize: DimensionsResource.FONT_SIZE_MEDIUM)),
              onTap: () {}, // Add functionality
            ),
            ListTile(
              leading: Icon(Icons.support, size: DimensionsResource.ICON_SIZE_MEDIUM),
              title: Text(StringResources.SUPPORT, style: TextStyle(fontSize: DimensionsResource.FONT_SIZE_MEDIUM)),
              onTap: () {}, // Add functionality
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}
