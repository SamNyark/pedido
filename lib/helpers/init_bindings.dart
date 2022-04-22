import 'package:get/get.dart';
import 'package:pedido/controllers/cart.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/controllers/controllers.dart';

Future<void> initBindings() async {
    Get.lazyPut(() => FirebaseForm());
    Get.lazyPut(() => Controllers());
    Get.lazyPut(() => CartController());
  }
