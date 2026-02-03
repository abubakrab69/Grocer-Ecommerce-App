import 'package:ecommerceapp/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.find<NavigationController>();
    return Obx(() {
      return BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        currentIndex: navigationController.currentIndex.value,
        onTap: navigationController.changeIndex,
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: 'Shopping',
            icon: Icon(Icons.shopping_bag),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(label: 'Account', icon: Icon(Icons.person)),
        ],
      );
    });
  }
}
