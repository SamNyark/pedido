import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pedido/screens/forms/login_page.dart';
import 'package:pedido/screens/home_page.dart';

class FirebaseForm extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rxn<User?> _user = Rxn<User>();

  String? get user => _user.value!.email;

  @override
  void onReady(){
    _user.bindStream(_auth.authStateChanges());
  }

  void createUser(String? username, email, password) async{
   await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => Get.offAll(const LoginPage())).onError((error, stackTrace) {
      Get.snackbar("Error", error.toString());
    });
  }

  void signIn(String email, password) async{
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value){
      Get.offAll(const HomePage());
    }).onError((error, stackTrace) {
      Get.snackbar("Error", error.toString());
    });
  }

  void signOut() async{
    await _auth.signOut();
  }

}