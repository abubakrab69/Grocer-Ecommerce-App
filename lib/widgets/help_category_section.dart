import 'package:ecommerceapp/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpCategorySection extends StatelessWidget {
  const HelpCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    final categories = [
      {'icon': Icons.shopping_bag, 'title': 'Order'},
      {'icon': Icons.payment, 'title': 'Payment'},
      {'icon': Icons.local_shipping, 'title': 'Shipping'},
      {'icon': Icons.assignment_return, 'title': 'Return'},
    ];

    return Padding(
      padding: .all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Help Categories',
            style: GoogleFonts.poppins(
              fontSize: 21,
              fontWeight: FontWeight.w500,
              color: isdark ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 15),
          GridView.builder(
            itemCount: categories.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 13,
              crossAxisSpacing: 13,
            ),

            itemBuilder: (context, index) {
              return CategoryCard(
                onTap: () {},
                title: categories[index]['title'] as String,
                icon: categories[index]['icon'] as IconData,
              );
            },
          ),
        ],
      ),
    );
  }
}
