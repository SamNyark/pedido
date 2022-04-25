import 'package:get/get.dart';

class CartController extends GetxController {
  int quantity = 1;

  Map<String, dynamic> items = {};

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      quantity += 1;
    } else {
      quantity = checkQuantity(quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 1) {
      return 1;
    }
    return quantity;
  }

  void initQuantity() {
    quantity = 1;
  }
}
