import 'package:ecommerceapp/controllers/theme_controller.dart';
import 'package:ecommerceapp/models/product_model.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/widgets/category_chip.dart';
import 'package:ecommerceapp/widgets/custom_search_bar.dart';
import 'package:ecommerceapp/widgets/product_grid.dart';
import 'package:ecommerceapp/widgets/sale_banners.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: .all(10),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 23,
                          backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?semt=ais_hybrid&w=740&q=80',
                          ),
                        ),
                        SizedBox(width: 13),
                        Column(
                          mainAxisAlignment: .start,
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Hello, Alex',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: isdark ? Colors.grey : Colors.grey,
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
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Badge.count(
                          count: 199,
                          child: Icon(Icons.shopping_cart_outlined),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Badge.count(
                          count: 29,
                          child: Icon(Icons.notifications_none_rounded),
                        ),
                      ),
                      GetBuilder<ThemeController>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                            controller.toggleTheme();
                          },
                          icon: Icon(
                            controller.isDarkMode
                                ? Icons.light_mode
                                : Icons.dark_mode,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const CustomSearchBar(),

            const CategoryChip(),
            SizedBox(height: 10),

            const SaleBanners(),

            Padding(
              padding: const .symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .center,
                children: [
                  Text(
                    'Popular products',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: GoogleFonts.poppins(fontSize: 15),
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
