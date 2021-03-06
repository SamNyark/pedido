import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/controllers.dart';
import 'package:pedido/helpers/routes.dart';

class FirebaseForm extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  final Controllers _controllers = Get.find();
  Timer? _timer;

  @override
  void onInit() {
    _auth.authStateChanges().listen((event) {
      if (event == null) {
        //  TODO
        _controllers.isLoggedIn(false);
      } else {
        _controllers.isLoggedIn(true);
      }
    });

    super.onInit();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  Future<void> createUser(_email, _password, _username) async {
    try {
      _controllers.isLoading(false);
      await _auth
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((value) async {
        await _auth.currentUser!.sendEmailVerification();
        Get.snackbar("Verification",
            "email verification sent to $_email, click to confirm");
        _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
          emailVerified();
        });
        FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).set({
          'email': value.user!.email,
          'username': _username,
        });
      }).onError((error, stackTrace) {
        Get.snackbar("Error", error.toString(),
            colorText: Colors.white, backgroundColor: const Color(0xfffa3116));
      });
    } finally {
      _controllers.isLoading(true);
    }
  }

  Future<void> login(_email, _password) async {
    try {
      _controllers.isLoading(false);
      await _auth
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then((value) {
        Get.offNamed(Routes.initial);
        _controllers.isLoggedIn(true);
      }).onError((error, stackTrace) {
        var str = error.toString().substring(error.toString().indexOf('T'));
        Get.snackbar("Error", str,
            colorText: Colors.white, backgroundColor: const Color(0xfffa3116));
      });
    } finally {
      _controllers.isLoading(true);
    }
  }

  void signOut() async {
    await _auth.signOut();
  }

  void passwordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email).then((value) {
        Get.offNamed(Routes.login);
        Get.snackbar(
            "Reset", "A link have been sent to $email. Click to reset password",
            duration: const Duration(seconds: 5));
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("title", "$e");
    }
  }

  Future<void> emailVerified() async {
    user = _auth.currentUser;
    await user!.reload();
    if (user!.emailVerified) {
      _timer!.cancel();
      Get.offAndToNamed(Routes.initial);
      _controllers.isLoggedIn(true);
    }
  }
}
