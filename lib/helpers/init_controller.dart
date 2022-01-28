import 'package:get/get.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/controllers/controllers.dart';

class InitDept implements Bindings{
  @override
  void dependencies() {
     Get.lazyPut(() => FirebaseForm());
     Get.lazyPut(() => Controllers());

  }

}