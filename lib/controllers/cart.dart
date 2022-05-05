import 'package:get/get.dart';
import 'package:pedido/model/cart.dart';

class CartController extends GetxController {
  int quantity = 1;
  int totalQuantity = 0;

  Map<String, CartModel> items = {};

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

  void cartChange(int index, bool value) {
    if(value){
     getItems[index].quantity = getItems[index].quantity! + 1;
    }else{
      getItems[index].quantity = checkQuantity(getItems[index].quantity!- 1);
    }
    update();
  }

  void totalQuantityf() {
    var value = 0;
    items.entries.forEach(
      (element) {
        value += (element.value.quantity) as int;
      },
    );
    totalQuantity = value;
    value = 0;
    update();
  }

  List<CartModel> get getItems {
    return items.entries.map((e) {
      return e.value;
    }).toList();
  }
}
