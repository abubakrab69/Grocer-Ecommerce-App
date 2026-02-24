import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final String content;
  const InfoSection({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: .all(15),
      padding: .all(20),
      decoration: BoxDecoration(
        color: isdark ? Colors.grey[900] : Colors.grey[200],
        borderRadius: .circular(10),
      ),
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: isdark ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isdark ? Colors.grey[700] : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
