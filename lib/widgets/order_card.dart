import 'package:ecommerceapp/models/order.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderCard extends StatelessWidget {
  final MyOrder order;
  final VoidCallback onViewDetails;

  const OrderCard({
    super.key,
    required this.order,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onViewDetails,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(13),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[850] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black26 : Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[900] : Colors.grey[200],
              ),
              child: Image.asset(order.imageUrl.toString(), fit: BoxFit.cover),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Order # ${order.orderNumber}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${order.itemCount.length} items',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '\$${order.totalAmount}',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                buildOrderStatus(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderStatus(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        order.statusString,
        style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
      ),
    );
  }
}
