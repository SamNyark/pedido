import 'package:get/get.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/controllers/loading.dart';

class InitDept implements Bindings{
  @override
  void dependencies() {
     Get.lazyPut(() => FirebaseForm());
     Get.lazyPut(() => Loading());

  }

}