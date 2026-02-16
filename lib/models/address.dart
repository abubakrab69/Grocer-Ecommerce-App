enum Address { home, office, other }

class address {
  final String id;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final String phoneNumber;
  final Address type;
  final bool isdefault;
  address({
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
