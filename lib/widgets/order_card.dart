import 'package:ecommerceapp/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onViewDetails,
      child: Container(
        width: double.infinity,
        // height: 400,
        padding: .all(10),
        margin: .all(8),
        decoration: BoxDecoration(
          color: isdark ? Colors.grey[800] : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              spreadRadius: 0.5,
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .center,
          children: [
            Container(child: Image.asset(order.imageUrl, fit: BoxFit.contain)),
            Column(
              mainAxisAlignment: .start,
              children: [
                Text(
                  'Order #${order.orderNumber}',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isdark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  'Order #${order.orderDate}',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isdark ? Colors.grey[500] : Colors.grey[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
