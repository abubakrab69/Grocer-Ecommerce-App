import 'package:get/get.dart';

class CartCountController extends GetxController {
  final RxInt cartcount = 1.obs;
  RxBool isLiked = true.obs;

  void increament(Value) {
    cartcount.value++;
  }

  void decreament(Value) {
    cartcount.value--;
    if (cartcount.value < 0) {
      cartcount.value = 0;
    }
  }

  void likedCategory(Value) {
    !isLiked.value;
  }
}
