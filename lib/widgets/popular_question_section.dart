import 'package:ecommerceapp/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularQuestionSection extends StatelessWidget {
  const PopularQuestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: .all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: .start,
        children: [
          Text(
            'Popular Questions',
            style: GoogleFonts.poppins(
              fontSize: 21,
              fontWeight: FontWeight.w500,
              color: isdark ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 15),
          QuestionCard(
            title: 'How can i track my order?',
            icon: Icons.local_shipping,
          ),
          SizedBox(height: 10),
          QuestionCard(
            title: 'How can return an item?',
            icon: Icons.local_shipping,
          ),
        ],
      ),
    );
  }
}
