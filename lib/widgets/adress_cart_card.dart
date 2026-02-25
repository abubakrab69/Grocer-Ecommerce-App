import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AdressCartCard extends StatelessWidget {
  const AdressCartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isdark ? Colors.grey[900] : Colors.grey[200],
        borderRadius: .circular(15),
      ),
      child: ListTile(
        leading: Icon(Icons.location_pin, color: AppTheme.light.primaryColor),
        title: Text(
          'Home',
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: isdark ? Colors.grey[200] : Colors.grey[800],
          ),
        ),
        subtitle: Text(
          '123 Main street, APT 48, New york, NY 100001',
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: isdark ? Colors.grey[200] : Colors.grey[800],
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit, color: AppTheme.light.primaryColor),
        ),
      ),
    );
  }
}
