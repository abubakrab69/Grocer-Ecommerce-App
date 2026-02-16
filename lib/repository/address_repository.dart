import 'package:ecommerceapp/models/address.dart';

class AddressRepository {
  List<address> getAddresses() {
    return [
      address(
        id: '1',
        city: 'Lahore',
        state: 'RX',
        country: 'Pakistan',
        postalCode: '120',
        phoneNumber: '03708904231',
        type: Address.home,
        isdefault: true,
      ),
      address(
        id: '2',
        city: 'Lahore',
        state: 'RX',
        country: 'Pakistan',
        postalCode: '130',
        phoneNumber: '03708904231',
        type: Address.office,
        isdefault: false,
      ),
    ];
  }

  address? getAddressById(String id) {
    return getAddresses().firstWhere(
      (address) => address.isdefault,
      orElse: () => getAddresses().first,
    );
  }
}
