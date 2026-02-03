import 'package:ecommerceapp/utils/app_teststyle.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChip extends StatefulWidget {
  const CategoryChip({super.key});

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    int selectedIndex = 0;
    final Categories = ['All', 'Fruites', 'Vegetable', 'Meat'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          Categories.length,
          (index) => Padding(
            padding: .all(10),
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(borderRadius: .circular(50)),
              child: ChoiceChip(
                label: Text(
                  Categories[index],
                  style: TextStyle(
                    color: selectedIndex == index
                        ? Colors.white
                        : isdark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                selected: selectedIndex == index,

                onSelected: (bool selected) {
                  setState(() {
                    selectedIndex = selected ? index : selectedIndex;
                  });
                },

                selectedColor: AppTheme.light.primaryColor,
                backgroundColor: isdark ? Colors.grey[800] : Colors.grey[400],
                shape: RoundedRectangleBorder(borderRadius: .circular(50)),
                elevation: selectedIndex == index ? 2 : 1,
                pressElevation: 0,
                labelPadding: .symmetric(horizontal: 10),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: BorderSide(
                  width: 0.8,
                  color: selectedIndex == index
                      ? Colors.transparent
                      : isdark
                      ? Colors.grey[400]!
                      : Colors.grey[900]!,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
