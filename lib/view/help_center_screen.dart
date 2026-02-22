import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(
          'Help Center',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [buildSearchBar(context)]),
      ),
    );
  }

  Widget buildSearchBar(BuildContext context) {
    final isdsark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,
            color: isdsark ? Colors.grey[400] : Colors.grey[700],
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: isdsark ? Colors.grey[400]! : Colors.grey[700]!,
            ),
            borderRadius: .circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: AppTheme.light.primaryColor,
            ),
            borderRadius: .circular(12),
          ),
          hintStyle: GoogleFonts.poppins(
            fontSize: 16,
            color: isdsark ? Colors.grey[400] : Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
