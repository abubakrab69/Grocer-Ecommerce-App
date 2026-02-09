import 'package:ecommerceapp/widgets/category_chip.dart';
import 'package:ecommerceapp/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // ✅ FIXED (. removed)
                children: [
                  Text(
                    'Shopping',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.search),
                      SizedBox(width: 8),
                      Icon(Icons.filter_list),
                    ],
                  ),
                ],
              ),
            ),

            /// ✅ VERY IMPORTANT FIX
            Expanded(
              child: Column(
                children: const [
                  CategoryChip(),
                  SizedBox(height: 10),
                  Expanded(child: ProductGrid()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
