import 'package:ecommerceapp/controllers/theme_controller.dart';
import 'package:ecommerceapp/models/product_model.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/view/all_product_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;

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
                              color: Colors.grey,
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

                  /// Icons
                  Row(
                    children: [
                      Badge.count(
                        count: 3,
                        child: Icon(Icons.shopping_cart_outlined),
                      ),
                      SizedBox(width: 10),
                      Badge.count(count: 3, child: Icon(CupertinoIcons.bell)),
                      SizedBox(width: 10),
                      Badge.count(
                        count: 3,
                        child: Icon(Icons.shopping_cart_outlined),
                      ),
                      SizedBox(width: 10),
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
