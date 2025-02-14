import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/categories_screen.dart';
import '../../screens/favorites_screen.dart';
import '../../screens/product_screen.dart';
import '../../screens/user_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.6),
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        switch (index) {
          case 0:
            Get.off(() => ProductScreen());
            break;
          case 1:
            Get.to(() => CategoriesScreen());
            break;
          case 2:
            Get.to(() => FavoritesScreen());
            break;
          case 3:
            Get.to(() => UserScreen());
            break;
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Products'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
