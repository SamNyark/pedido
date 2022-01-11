import 'package:get/get.dart';

class SignUp extends GetxController{
  bool _showPassword = true;
  bool get showPassword => _showPassword;

  void toggle() {
      _showPassword = !_showPassword;
      update();
    
  }
}