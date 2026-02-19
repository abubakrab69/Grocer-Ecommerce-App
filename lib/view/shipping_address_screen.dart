import 'dart:ui';

import 'package:ecommerceapp/models/address.dart';
import 'package:ecommerceapp/repository/address_repository.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
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
      child: AddressCard(
        address: address,
        ondelete: () => _showDeletedConfirmation(context),
        onedit: () => _showEditBottomSheet(context, address),
      ),
    );
  }

  void _showDeletedConfirmation(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    Get.dialog(
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: true,
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              decoration: BoxDecoration(
                color: isdark
                    ? Colors.white.withOpacity(0.08)
                    : Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.delete, color: Colors.red, size: 32),

                  const SizedBox(height: 12),

                  Text(
                    'Are you sure to Delete location?',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () => Get.back(),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.blue, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            Get.back();
                            Get.snackbar(
                              'Deleted Successfully',
                              colorText: Colors.green,
                              'Deleted successfully',

                              borderRadius: 50,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: BoxBorder.all(
                                width: 2,
                                color: isdark
                                    ? Colors.grey[800]!
                                    : Colors.grey[400]!,
                              ),
                              borderRadius: BorderRadius.circular(50),
                              color: isdark
                                  ? Colors.grey[800]
                                  : Colors.grey[400],
                            ),
                            child: Center(
                              child: Text(
                                'Delete',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showEditBottomSheet(BuildContext context, Address address) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: isdark ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Edit address',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
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
            ),
            buildTextFields(context, 'Name', Icons.person),
            SizedBox(height: 10),
            buildTextFields(context, 'Full address', Icons.location_on),
            SizedBox(height: 10),
            buildTextFields(context, 'City', Icons.phone),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildTextFields(
    BuildContext context,
    String label,
    IconData icon, {
    String? initialvalue,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      child: TextFormField(
        initialValue: initialvalue,
        decoration: InputDecoration(
          label: Text(label),
          prefixIcon: Icon(icon),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
            borderRadius: .circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppTheme.light.primaryColor,
            ),
            borderRadius: .circular(8),
          ),
        ),
      ),
    );
  }
}
