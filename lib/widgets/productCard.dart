import 'package:ecommerceapp/models/product_model.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Productcard extends StatelessWidget {
  final Product product;
  const Productcard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDark ? Colors.grey[900] : Colors.grey[100],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(''),
              Positioned(
                top: 10,
                left: 5,
                child: Container(
                  padding: .all(9),
                  decoration: BoxDecoration(
                    color: AppTheme.light.primaryColor,
                    borderRadius: .circular(50),
                  ),
                  child: Text('isfavourite'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
