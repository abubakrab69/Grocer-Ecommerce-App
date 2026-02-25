import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: .all(10),
      decoration: BoxDecoration(
        color: isdark ? Colors.grey[900] : Colors.grey[200],
        borderRadius: .circular(15),
      ),
      child: ListTile(
        leading: Icon(
          Icons.payment_rounded,
          color: AppTheme.light.primaryColor,
        ),
        title: Text(
          'Visa ending in 4242',
          style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey),
        ),
        subtitle: Text(
          'Expires 12/24',
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit, color: AppTheme.light.primaryColor),
        ),
      ),
    );
  }
}
