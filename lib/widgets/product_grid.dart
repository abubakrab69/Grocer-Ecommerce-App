import 'package:ecommerceapp/models/product_model.dart';
import 'package:ecommerceapp/widgets/productCard.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 3,
        crossAxisSpacing: 2,
        childAspectRatio: 0.3,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {},
          child: Productcard(product: product),
        );
      },
    );
  }
}
