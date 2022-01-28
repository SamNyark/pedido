import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/controllers/controllers.dart';
import 'package:pedido/screens/forms/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email, _password;

  FirebaseForm formController = Get.find();
  Controllers loading = Get.find();

  bool _showPassword = true;

  void showPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffe3c08a), Color(0xffffb13d)])),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              IconButton(
              padding: const EdgeInsets.only(right: 320),
              onPressed: () {
                Get.back();
              },
              iconSize: 30,
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
              Container(
                  margin: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  padding: const EdgeInsets.only(top: 10),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            validator: (input) {
                              if (input == null || input.isEmpty) {
                                return "Please fill out this field";
                              } else if (!RegExp(
                                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(input)) {
                                return "Please fill out a valid email";
                              }
                            },
                            onSaved: (input) {
                              _email = input;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.grey[700],
                              ),
                              labelText: "Email",
                              labelStyle: const TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      width: 3,
                                      style: BorderStyle.solid,
                                      color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      width: 3,
                                      style: BorderStyle.solid,
                                      color: Colors.white)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 3,
                                      style: BorderStyle.solid,
                                      color: Colors.red.shade400)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 3,
                                      style: BorderStyle.solid,
                                      color: Colors.red.shade400)),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (input) {
                              if (input == null || input.isEmpty) {
                                return "Please fill out this field";
                              }
                              if (!RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                                  .hasMatch(input)) {
                                return "password must contain atleast one uppercase letter, a \nlowercase letter and a number ";
                              }
                            },
                            onSaved: (input) {
                              _password = input;
                            },
                            obscureText: _showPassword,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey[700],
                              ),
                              labelText: "Password",
                              labelStyle: const TextStyle(color: Colors.black),
                              suffixIcon: IconButton(
                                icon: Icon(_showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  showPassword();
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      width: 3,
                                      style: BorderStyle.solid,
                                      color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      width: 3,
                                      style: BorderStyle.solid,
                                      color: Colors.white)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 3,
                                      style: BorderStyle.solid,
                                      color: Colors.red.shade400)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 3,
                                      style: BorderStyle.solid,
                                      color: Colors.red.shade400)),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //todo
                                },
                                child: const Text(
                                  "forget password",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Obx(() => SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 2 / 3,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    shadowColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    )),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    formController.login(_email, _password);
                                  }
                                },
                                child:  loading.isLoading() ? const Text(
                                  "Login",
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ) : 
                                const CircularProgressIndicator(color: Colors.blue,),
                                )
                              ),
                            ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const SignupPage());
                                },
                                child: const Text(
                                  "Signup",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.deepOrange,
                                      fontFamily: "OrelegaOne"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ))),
            ],
          ),
        ));
  }
}
