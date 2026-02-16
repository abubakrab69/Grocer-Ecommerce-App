import 'package:ecommerceapp/models/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  const AddressCard({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Container(child: Text('address card'));
  }
}
