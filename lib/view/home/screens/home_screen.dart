import 'package:ecommerceapp/controllers/theme_controller.dart';
import 'package:ecommerceapp/models/product_model.dart';
import 'package:ecommerceapp/repository/notification_repository.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/view/all_product_screen.dart';
import 'package:ecommerceapp/view/my_cart_screen.dart';
import 'package:ecommerceapp/view/notification_screen.dart';
import 'package:ecommerceapp/widgets/category_chip.dart';
import 'package:ecommerceapp/widgets/custom_search_bar.dart';
import 'package:ecommerceapp/widgets/product_grid.dart';
import 'package:ecommerceapp/widgets/sale_banners.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationRepository repository = NotificationRepository();
  @override
  Widget build(BuildContext context) {
    final repository = NotificationRepository();
    final isdark = Theme.of(context).brightness == Brightness.dark;
    ThemeController themeController = Get.put(ThemeController());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 23,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?semt=ais_hybrid&w=740&q=80',
                        ),
                      ),
                      const SizedBox(width: 13),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Alex',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: isdark ? Colors.grey : Colors.grey[800],
                            ),
                          ),
                          Text(
                            'Good Morning',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: isdark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // navbar icons
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(MyCartScreen());
                        },
                        child: Badge.count(
                          isLabelVisible: products.length > 0,
                          count: products.length,
                          child: Icon(Icons.shopping_cart_outlined),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () => Get.to(NotificationScreen()),
                        child: Badge.count(
                          isLabelVisible:
                              repository.getNotifications().length > 0,
                          count: NotificationRepository()
                              .getNotifications()
                              .length,
                          child: Icon(CupertinoIcons.bell),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          themeController.toggleTheme();
                        },
                        icon: Icon(
                          isdark ? Icons.light_mode : Icons.nightlight_outlined,
                          color: isdark ? Colors.yellow : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const CustomSearchBar(),
            const CategoryChip(),
            const SizedBox(height: 10),
            const SaleBanners(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular products',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(const AllProductScreen());
                    },
                    child: Text(
                      'See All',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Expanded(child: ProductGrid()),
          ],
        ),
      ),
    );
  }
}
