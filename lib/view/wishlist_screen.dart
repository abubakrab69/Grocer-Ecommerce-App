import 'package:ecommerceapp/models/product_model.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'My Wishlist',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: isdark ? Colors.white : Colors.black,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: buildSummaryContext(context)),
          SliverPadding(
            padding: const EdgeInsetsGeometry.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: products.where((p) => p.isFavourite).length,
                (context, index) {
                  return buildWishlistItems(
                    context,
                    products.where((p) => p.isFavourite).toList()[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSummaryContext(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    final favouritProduct = products.where((p) => p.isFavourite).length;

    return Container(
      padding: const .all(16),
      decoration: BoxDecoration(
        color: isdark ? Colors.grey[800] : Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                '$favouritProduct items',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: isdark ? Colors.white : Colors.black,
                ),
              ),
              Text(
                'In your wishlist',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isdark ? Colors.grey : Colors.grey,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const .symmetric(horizontal: 19, vertical: 14),
              decoration: BoxDecoration(
                color: AppTheme.light.primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'Add all to cart',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWishlistItems(BuildContext context, Product product) {
    final isdark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: .symmetric(vertical: 5),
      padding: .all(9),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: isdark ? Colors.grey[900] : Colors.grey[200],
        borderRadius: .circular(10),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .center,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: isdark ? Colors.grey[800] : Colors.grey[300],
              borderRadius: .only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Image.asset(product.imageUrl, fit: BoxFit.cover),
          ),
          Column(
            crossAxisAlignment: .start,
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: isdark ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    product.category,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isdark ? Colors.grey[600] : Colors.grey[500],
                    ),
                  ),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.light.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: .end,
            crossAxisAlignment: .center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: isdark ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
