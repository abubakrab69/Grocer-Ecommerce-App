import 'package:ecommerceapp/repository/address_repository.dart';
import 'package:ecommerceapp/widgets/address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    AddressRepository _repository = AddressRepository();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          'Shipping Address',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
        ],
      ),
      body: ListView.builder(
        itemCount: _repository.getAddresses().length,
        itemBuilder: (context, index) {
          return buildAddressCard(context, index);
        },
      ),
    );
  }

  Widget buildAddressCard(BuildContext context, int index) {
    AddressRepository _repository = AddressRepository();
    final isdark = Theme.of(context).brightness == Brightness.dark;
    final address = _repository.getAddresses()[index];
    return Container(
      padding: .all(10),
      margin: .all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: isdark ? Colors.grey[900] : Colors.grey[200],
      ),
      child: AddressCard(address: address, ondelete: () {}, onedit: () {}),
    );
  }
}
