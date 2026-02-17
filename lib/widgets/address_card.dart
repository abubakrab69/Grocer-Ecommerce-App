import 'package:ecommerceapp/models/address.dart';
import 'package:ecommerceapp/repository/address_repository.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  final VoidCallback ondelete;
  final VoidCallback onedit;
  const AddressCard({
    super.key,
    required this.address,
    required this.ondelete,
    required this.onedit,
  });

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    AddressRepository addressRepository = AddressRepository();
    return Container(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isdark
                  ? AppTheme.light.primaryColor
                  : AppTheme.light.primaryColor,
              borderRadius: .circular(10),
            ),
            child: Icon(Icons.location_pin),
          ),
          SizedBox(width: 22),
          Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                children: [
                  Text(
                    address.type.toString().split('.').last.toLowerCase(),
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  if (address.isdefault) ...[
                    SizedBox(width: 10),
                    Container(
                      padding: .all(6),
                      decoration: BoxDecoration(
                        color: isdark
                            ? Colors.green.withOpacity(.2)
                            : Colors.green.withOpacity(.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Default',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: isdark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 7),
              Text(
                '${address.city}, ${address.country}, ${address.postalCode}, ${address.phoneNumber}, ${address.id}',
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
              ),

              Divider(
                color: isdark ? Colors.grey[200] : Colors.grey[900],
                height: 20,
                thickness: 3,
                endIndent: .1,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: onedit,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          color: isdark ? Colors.grey[200] : Colors.grey[900],
                        ),
                        SizedBox(width: 7),
                        Text(
                          'Edit',
                          style: GoogleFonts.poppins(
                            color: isdark ? Colors.grey[200] : Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 62),
                  InkWell(
                    onTap: ondelete,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        SizedBox(width: 7),
                        Text(
                          'Delete',
                          style: GoogleFonts.poppins(color: Colors.red),
                        ),
                      ],
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
