import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterBottomSheet {
  static void show(BuildContext context) {
    final isdark = AppTheme.light.brightness == Brightness.dark;

    showModalBottomSheet(
      backgroundColor: AppTheme.light.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          padding: .all(10),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Filter Products',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: isdark ? Colors.white : Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      color: isdark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Price Range',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .45,
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hint: Text('Min'),
                        prefixText: '\$',
                        hintStyle: GoogleFonts.poppins(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                            color: const Color.fromARGB(255, 221, 221, 221),
                          ),
                          borderRadius: .circular(9),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: AppTheme.light.primaryColor,
                          ),
                          borderRadius: .circular(9),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .45,
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hint: Text('Max'),
                        prefixText: '\$',
                        hintStyle: GoogleFonts.poppins(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                            color: const Color.fromARGB(255, 221, 221, 221),
                          ),
                          borderRadius: .circular(9),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: AppTheme.light.primaryColor,
                          ),
                          borderRadius: .circular(9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Categories',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 9),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ['All', 'Fruites', 'Vegetables', 'Meat', 'Dry Fruit']
                    .map(
                      (category) => FilterChip(
                        label: Text(category),
                        selected: category == 'All',
                        onSelected: (selected) {},
                        backgroundColor: AppTheme.light.cardColor,
                        selectedColor: AppTheme.light.primaryColor,
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 19),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: .circular(50),
                    color: AppTheme.light.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'Apply Filter',
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
