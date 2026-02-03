import 'package:ecommerceapp/controllers/navigation_controller.dart';
import 'package:ecommerceapp/controllers/theme_controller.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/view/account_screen.dart';
import 'package:ecommerceapp/view/home/screens/home_screen.dart';
import 'package:ecommerceapp/view/shopping_screen.dart';
import 'package:ecommerceapp/view/wishlist_screen.dart';
import 'package:ecommerceapp/widgets/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.put(
      NavigationController(),
    );
    return GetBuilder<ThemeController>(
      builder: (ThemeController) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: Obx(() {
            return IndexedStack(
              key: ValueKey(navigationController.currentIndex.value),
              index: navigationController.currentIndex.value,
              children: [
                HomeScreen(),
                ShoppingScreen(),
                WishlistScreen(),
                AccountScreen(),
              ],
            );
          }),
        ),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }
}
