import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/controllers/signup.dart';
import 'package:pedido/screens/forms/login_page.dart';
import 'package:pedido/helpers/init_controller.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final SignUp signupController = Get.find();
  final FirebaseForm formController = Get.find();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _email, _password, _username;

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
            IconButton(
              padding: const EdgeInsets.only(right: 350),
              onPressed: () {
                Get.back();
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
                        obscureText: signupController.showPassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey[700],
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              signupController.toggle();
                            },
                            icon: GetBuilder<SignUp>(builder: (_){
                             return Icon(_.showPassword
                                ? Icons.visibility
                                : Icons.visibility_off);
                            }),
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
                      SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 2 / 3,
                          child: ElevatedButton(
                              child: const Text(
                                "sign up",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
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
                      const SizedBox(height: 15),
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 2 / 3,
                          child: ElevatedButton(
                              child: const Text(
                                "login",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff74B51F)),
                              ),
                              onPressed: () {
                                Get.to(const LoginPage());
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  padding: const EdgeInsets.all(8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25)))))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
