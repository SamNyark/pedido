import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/controllers.dart';
import 'package:pedido/screens/forms/login_page.dart';
import 'package:pedido/screens/home_page.dart';

class FirebaseForm extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Controllers _controllers = Get.find();


  @override
  void onInit(){
    _auth.authStateChanges().listen((event) {
      if(event == null){
        //  TODO
        print("no user");
          _controllers.isLoggedIn(false);
      }else {print("signed in");
          _controllers.isLoggedIn(true);
      }
     });
     super.onInit();
  }

  void createUser(String? username, email, password) async{
    try{
   _controllers.isLoading(false);  
   await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) async{ 
   await _auth.currentUser!.sendEmailVerification();
              Get.offAll(const LoginPage());}).onError((error, stackTrace) {
      Get.snackbar("Error", error.toString(), colorText: Colors.white, backgroundColor: const Color(0xfffa3116));
    });
  }finally{
    _controllers.isLoading(true);
  }
  }

  void login(email, password) async{
    try{
    _controllers.isLoading(false);
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value){
      Get.offAll(const HomePage());
      _controllers.isLoggedIn(true);
    }).onError((error, stackTrace) {
      Get.snackbar("Error", error.toString(), colorText: Colors.white, backgroundColor: const Color(0xfffa3116));
    });
  }
  finally{
    _controllers.isLoading(true);
  }
  }

  void signOut() async{
    await _auth.signOut();
  }

}