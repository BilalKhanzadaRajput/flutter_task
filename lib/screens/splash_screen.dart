import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/controllers/splash_screen_controller.dart';
import 'package:flutter_task/helper/constants/dimensions_resource.dart';
import 'package:flutter_task/helper/constants/string_resources.dart';
import 'package:get/get.dart';

import '../helper/constants/colors_resource.dart';
import '../helper/constants/image_resources.dart';
import '../model/categories_details_model.dart';

class SplashScreen extends StatefulWidget {

  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ImageResources.SPLASH_LOGO,
            fit: BoxFit.cover,
          ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: DimensionsResource.PADDING_SIZE_LARGE),
                  Center(
                    child: Text(
                      StringResources.MY_STORE,
                      style:
                      Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: DimensionsResource.FONT_SIZE_36,
                      color: ColorResources.BLACK_COLOR,
                    ),
                    ),
                  ),
                  const Spacer(),
                  // Bottom text section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          StringResources.WELCOME_TEXT,
                          style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: DimensionsResource.FONT_SIZE_LARGE.sp,
                            color: ColorResources.PRIMARY_COLOR,
                          ),
                        ),
                      ),
                      const SizedBox(height: DimensionsResource.PADDING_SIZE_DEFAULT),
                      Center(
                        child: Text(
                          StringResources.SPLASH_DESCRIPTION,
                          style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: DimensionsResource.FONT_SIZE_MEDIUM.sp,
                            color: ColorResources.PRIMARY_COLOR,
                          ),
                        ),
                      ),
                      SizedBox(height: DimensionsResource.PADDING_SIZE_DEFAULT),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}