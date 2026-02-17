enum AddressType { home, office, other }

class Address {
  final String id;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final String phoneNumber;
  final AddressType type;
  final bool isdefault;
  Address({
    required this.id,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.phoneNumber,
    required this.type,
    required this.isdefault,
  });
}
