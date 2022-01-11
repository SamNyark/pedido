import 'package:get/get.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/controllers/signup.dart';

class initDept implements Bindings{
  @override
  void dependencies() {
     Get.lazyPut(() => FirebaseForm());
     Get.lazyPut(() => SignUp());

  }

}