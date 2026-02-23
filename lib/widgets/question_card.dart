import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const QuestionCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: .all(19),
      decoration: BoxDecoration(
        color: isdark ? Colors.grey[900] : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.light.primaryColor),
          SizedBox(width: 15),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
