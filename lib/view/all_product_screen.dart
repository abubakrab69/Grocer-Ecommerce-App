import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/widgets/filter_bottom_sheet.dart';
import 'package:ecommerceapp/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = AppTheme.light.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        title: Text(
          'All Products',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: isdark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {
              FilterBottomSheet.show(context);
            },
            icon: Icon(Icons.filter_list),
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
