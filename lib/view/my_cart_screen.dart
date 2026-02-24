import 'package:ecommerceapp/controllers/cart_count_controller.dart';
import 'package:ecommerceapp/models/product_model.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/view/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: isdark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'My Cart',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isdark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return buildCartItem(product: products[index]);
        },
      ),
      bottomNavigationBar: BuildCartInfo(),
    );
  }
}

//item
class buildCartItem extends StatelessWidget {
  final Product product;
  const buildCartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    CartCountController cartCountController = Get.put(CartCountController());
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 1,

      height: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: isdark ? Colors.grey[900] : Colors.grey[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 95,
            decoration: BoxDecoration(
              color: isdark ? Colors.black : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Image.asset(product.imageUrl, fit: BoxFit.cover),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                product.name,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Icon(Icons.delete, color: Colors.red),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      cartCountController.decreament(Value);
                    },
                    icon: Container(
                      width: 37,
                      height: 37,
                      decoration: BoxDecoration(
                        color: isdark ? Colors.grey[800] : Colors.grey[400],
                        borderRadius: .circular(6),
                      ),
                      child: Icon(
                        Icons.minimize,
                        color: isdark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      cartCountController.cartcount.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: isdark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cartCountController.increament(Value);
                    },
                    icon: Container(
                      width: 37,
                      height: 37,
                      decoration: BoxDecoration(
                        color: isdark ? Colors.grey[800] : Colors.grey[400],
                        borderRadius: .circular(6),
                      ),
                      child: Icon(
                        Icons.add,
                        color: isdark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// total item price in bottom navigation bar...
class BuildCartInfo extends StatelessWidget {
  const BuildCartInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
      child: Container(
        margin: .symmetric(vertical: 25, horizontal: 13),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                'Total Items: ${products.length}',
                style: GoogleFonts.poppins(
                  color: isdark ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '\$5444',
                style: GoogleFonts.poppins(
                  color: AppTheme.light.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  Get.to(() => const CheckoutScreen());
                },
                child: Container(
                  // width: 20,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppTheme.light.primaryColor,
                    borderRadius: .circular(40),
                  ),
                  child: Center(
                    child: Text(
                      'Checkout',
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
