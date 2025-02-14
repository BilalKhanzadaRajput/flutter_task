import 'package:flutter/material.dart';

import '../constants/colors_resource.dart';
import '../constants/dimensions_resource.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall,
      ),
      backgroundColor: ColorResources.APP_BAR_BACKGROUND,
      centerTitle: true,
      elevation: DimensionsResource.D_4,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DimensionsResource.D_56);
}
