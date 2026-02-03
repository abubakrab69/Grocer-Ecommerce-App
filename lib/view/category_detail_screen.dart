import 'package:ecommerceapp/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Product product;
  const CategoryDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: GoogleFonts.poppins(
            color: isdark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _shareProducts(context, product.name, product.discription);
            },
            icon: Icon(CupertinoIcons.share_up),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Image.asset(product.imageUrl, fit: BoxFit.contain),
                  ),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_outline_rounded,
                      color: isdark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: .symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isdark ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    '${product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isdark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: .symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text(
                    product.category,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: isdark ? Colors.grey[300] : Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: .symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text(
                    'Select Quantity',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: isdark ? Colors.grey[300] : Colors.grey[900],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Container(
                    padding: .all(10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: .circular(3),
                      border: BoxBorder.all(
                        width: 1,
                        color: isdark ? Colors.grey[900]! : Colors.grey[400]!,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '1KG',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: isdark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: .all(10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: .circular(3),
                      border: BoxBorder.all(
                        width: 1,
                        color: isdark ? Colors.grey[900]! : Colors.grey[400]!,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '2KG',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: isdark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: .all(10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: .circular(3),
                      border: BoxBorder.all(
                        width: 1,
                        color: isdark ? Colors.grey[900]! : Colors.grey[400]!,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '3KG',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: isdark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: .all(10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: .circular(3),
                      border: BoxBorder.all(
                        width: 1,
                        color: isdark ? Colors.grey[900]! : Colors.grey[400]!,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '4KG',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: isdark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: .all(10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: .circular(3),
                      border: BoxBorder.all(
                        width: 1,
                        color: isdark ? Colors.grey[900]! : Colors.grey[400]!,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '5KG',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: isdark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text(
                    'Discription',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: isdark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Text(
                    product.discription,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: isdark ? Colors.grey : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _shareProducts(
    BuildContext context,
    String productName,
    String productDiscription,
  ) async {
    final Box = context.findRenderObject() as RenderBox;

    final String shopLink = 'https:// yourshop.com/product/cotton-tshirt';
    final String shareMessage = '$productDiscription\n\n\shop now at $shopLink';

    try {
      final ShareResult result = await Share.share(
        shareMessage,
        subject: productName,
        sharePositionOrigin: Box!.localToGlobal(Offset.zero) & Box.size,
      );
      if (result.status == ShareResultStatus.success) {
        debugPrint('Thank you for sharing');
      }
    } catch (e) {
      debugPrint('Error $e');
    }
  }
}
