import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/loading.dart';
import 'package:pedido/screens/forms/login_page.dart';
import 'package:pedido/screens/home_page.dart';
import 'package:pedido/widgets/account_screen.dart';

class FirebaseForm extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User? _user = FirebaseAuth.instance.currentUser;
  Loading loading = Get.find();


  @override
  void onInit(){
    _auth.authStateChanges().listen((event) {
      if(event == null){
        //  TODO
        print("no user");
      }else {print("signed in");
          AccountScreen.isLoggedIn = true;
      }
     });
     super.onInit();
  }

  void createUser(String? username, email, password) async{
    try{
   loading.isLoading(false);  
   await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) async{ if (_user != null && !_user!.emailVerified) {
   await _user!.sendEmailVerification();
}               Get.offAll(const LoginPage());}).onError((error, stackTrace) {
      Get.snackbar("Error", error.toString(), colorText: Colors.white, backgroundColor: const Color(0xfffa3116));
    });
  }finally{
    loading.isLoading(true);
  }
  }

  void login(email, password) async{
    try{
    loading.isLoading(false);
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value){
      Get.offAll(const HomePage());
      AccountScreen.isLoggedIn = true;
    }).onError((error, stackTrace) {
      Get.snackbar("Error", error.toString(), colorText: Colors.white, backgroundColor: const Color(0xfffa3116));
    });
  }
  finally{
    loading.isLoading(true);
  }
  }

  void signOut() async{
    await _auth.signOut();
  }

}