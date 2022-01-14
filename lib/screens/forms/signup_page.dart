import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/controllers/loading.dart';
import 'package:pedido/screens/forms/login_page.dart';
import 'package:pedido/screens/home_page.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseForm formController = Get.find();
  Loading loading = Get.find();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _email, _password, _username;

  bool _showPassword = true;

  void showPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

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
            const SizedBox(height: 18,),
            IconButton(
              padding: const EdgeInsets.only(right: 320),
              onPressed: () {
                Get.offAll(const HomePage());
              },
              iconSize: 30,
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Registration",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              padding: const EdgeInsets.only(top: 10),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (input) {
                          if (input == null || input.isEmpty) {
                            return "Field is required";
                          }
                          return null;
                        },
                        onSaved: (input) {
                          _username = input;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey[700],
                          ),
                          hintText: "Username",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 3)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 3)),
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
                        height: 10,
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
                          return null;
                        },
                        onSaved: (input) {
                          _email = input;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey[700],
                          ),
                          hintText: "Email",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 3)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 3)),
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
                        height: 10,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input == null || input.isEmpty) {
                            return "Please fill out this field";
                          } else if (input.length < 6) {
                            return "password should be more than six characters";
                          }
                          if (!RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                              .hasMatch(input)) {
                            return "password must contain atleast one uppercase, a \nlowercase letter and a number ";
                          }
                          return null;
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
                          suffixIcon: IconButton(
                            onPressed: () {
                              showPassword();
                            },
                            icon: Icon(_showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          hintText: "Password",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 3)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 3)),
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
                        height: 40,
                      ),
                      Obx(() => SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 2 / 3,
                            child: ElevatedButton(
                                child:  loading.isLoading() ? const Text(
                              "Signup",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ) : 
                            const CircularProgressIndicator(color: Colors.blue,),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    formController.createUser(_username, _email, _password);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    padding: const EdgeInsets.all(8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))))),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           const Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          const SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){
                              Get.to(LoginPage());
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 20, color: Colors.deepOrange, fontFamily: "OrelegaOne"),
                            ),
                          ), 
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
