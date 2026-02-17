import 'package:ecommerceapp/models/address.dart';

class AddressRepository {
  List<Address> getAddresses() {
    return [
      Address(
        id: '1',
        city: 'Lahore',
        state: 'RX',
        country: 'Pakistan',
        postalCode: '120',
        phoneNumber: '03708904231',
        type: AddressType.home,
        isdefault: true,
      ),
      Address(
        id: '2',
        city: 'Lahore',
        state: 'RX',
        country: 'Pakistan',
        postalCode: '130',
        phoneNumber: '03708904231',
        type: AddressType.office,
        isdefault: false,
      ),
    ];
  }

  Address? getAddressById(String id) {
    return getAddresses().firstWhere(
      (Address) => Address.isdefault == id,
      orElse: () => getAddresses().first,
    );
  }
}
