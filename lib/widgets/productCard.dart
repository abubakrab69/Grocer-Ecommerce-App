import 'package:ecommerceapp/models/product_model.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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
        borderRadius: BorderRadius.circular(14),
        color: isDark ? Colors.grey[900] : Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
            spreadRadius: 0.3,
            blurRadius: 0.5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 110,
                  child: Image.asset(product.imageUrl, fit: BoxFit.contain),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    width: 67,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppTheme.light.primaryColor,
                      borderRadius: .circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${calculateDiscount(product.price, product.oldPrice!)}% OFF',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              product.name,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(product.category, style: GoogleFonts.poppins(fontSize: 13)),
            Row(
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '\$${product.oldPrice}',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: isDark ? Colors.grey : Colors.grey[800],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int calculateDiscount(double currentPrice, double oldPrice) {
    return (((oldPrice - currentPrice) / oldPrice) * 100).round();
  }
}
