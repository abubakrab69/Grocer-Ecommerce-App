import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Search',
            fillColor: isdark ? Colors.grey[800] : Colors.grey[100],
            filled: true,
            hintStyle: TextStyle(color: isdark ? Colors.white : Colors.black),
            prefixIcon: Icon(
              Icons.search,
              color: isdark ? Colors.grey[400] : Colors.grey[600],
            ),
            suffixIcon: Icon(
              Icons.tune,
              color: isdark ? Colors.grey[400] : Colors.grey[600],
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                width: 1.5,
                color: AppTheme.light.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
