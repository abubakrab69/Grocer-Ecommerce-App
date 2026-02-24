import 'package:get/get.dart';

class CartCountController extends GetxController {
  final RxInt cartcount = 1.obs;

  void increament(Value) {
    cartcount.value++;
  }

  void decreament(Value) {
    cartcount.value--;
    if (cartcount.value < 0) {
      cartcount.value = 0;
    }
  }
}
