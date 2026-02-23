import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const QuestionCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isdark ? Colors.grey[900] : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        leading: Icon(icon, color: AppTheme.light.primaryColor),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: isdark ? Colors.grey[200]! : Colors.grey[900]!,
        ),
        onTap: () => _showAnswerBottomSheet(context, title, isdark),
      ),
    );
  }

  void _showAnswerBottomSheet(
    BuildContext context,
    String question,
    bool isdark,
  ) {
    Get.bottomSheet(
      Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: .min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    question,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                _getAddress(question),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isdark ? Colors.grey : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getAddress(String question) {
    final answers = {
      'How can i track my order?':
          'To track your order:\n\n'
          '1. go to "my order" in your account\n\n'
          '2. Select an order you want to track\n\n'
          '3. click on "Order track"\n\n'
          '4. you will get real update about your order\n\n',
      'How can return an item?':
          'To return an item:\n\n'
          '1. go to "my order" screen in your account\n\n'
          '2. Select "items" in your account screen\n\n',
    };
    return answers[question] ??
        'Information not awalable! please contact support for assistance';
  }
}
