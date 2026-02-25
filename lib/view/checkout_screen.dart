import 'package:ecommerceapp/widgets/adress_cart_card.dart';
import 'package:ecommerceapp/widgets/payment_method_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        title: Text(
          'Checkout',
          style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        padding: .all(12),
        child: Column(
          children: [
            buildSectionTile(context, 'Shipping Adress'),
            SizedBox(height: 10),
            AdressCartCard(),
            SizedBox(height: 10),
            buildSectionTile(context, 'Payment method'),
            SizedBox(height: 10),
            PaymentMethodCard(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTile(BuildContext context, String title) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
