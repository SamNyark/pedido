import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/controllers/controllers.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/helpers/dimensions.dart';
import 'package:pedido/helpers/routes.dart';
import 'package:pedido/pages/forms/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseForm formController = Get.find();
  Controllers loading = Get.find();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _email, _password, _firstName, _lastName;

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
            SizedBox(height: Dimensions.height30,),
            IconButton(
              padding: EdgeInsets.only(right: Dimensions.width320),
              onPressed: (){
              Get.toNamed(Routes.initial);
            }, icon: Icon(Icons.arrow_back_ios_new)),
            SizedBox(
              height: Dimensions.height50,
            ),
            Text("Registration",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.height20)),
            SizedBox(
              height: Dimensions.height20,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width50, right: Dimensions.width50),
              padding: EdgeInsets.only(top: Dimensions.height10),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.height60,
                        child: TextFormField(
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return "Field is required";
                            }
                            return null;
                          },
                          onSaved: (input) {
                            _firstName = input;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: AppColors.secondaryColor,
                            ),
                            hintText: "first name",
                            hintStyle: TextStyle(
                              fontSize: Dimensions.height16,
                              color: AppColors.secondaryColor
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    color: AppColors.secondaryColor,
                                    style: BorderStyle.solid,
                                    width: Dimensions.width3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: Dimensions.width3)),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    width: Dimensions.width3,
                                    style: BorderStyle.solid,
                                    color: Colors.red.shade400)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    width: Dimensions.width3,
                                    style: BorderStyle.solid,
                                    color: Colors.red.shade400)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      SizedBox(
                        height: Dimensions.height60,
                        child: TextFormField(
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return "Field is required";
                            }
                            return null;
                          },
                          onSaved: (input) {
                            _lastName = input;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: AppColors.secondaryColor,
                            ),
                            hintText: "Last name",
                            hintStyle: TextStyle(
                              fontSize: Dimensions.height16,
                              color: AppColors.secondaryColor
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    color: AppColors.secondaryColor,
                                    style: BorderStyle.solid,
                                    width: Dimensions.width3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: Dimensions.width3)),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    width: Dimensions.width3,
                                    style: BorderStyle.solid,
                                    color: Colors.red.shade400)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    width: Dimensions.width3,
                                    style: BorderStyle.solid,
                                    color: Colors.red.shade400)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: Dimensions.height60,
                        child: TextFormField(
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
                              color: AppColors.secondaryColor,
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: Dimensions.height16,
                              color: AppColors.secondaryColor
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    color: AppColors.secondaryColor,
                                    style: BorderStyle.solid,
                                    width: Dimensions.width3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: Dimensions.width3)),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    width: Dimensions.width3,
                                    style: BorderStyle.solid,
                                    color: Colors.red.shade400)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    width: Dimensions.width3,
                                    style: BorderStyle.solid,
                                    color: Colors.red.shade400)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      SizedBox(
                        height: Dimensions.height60,
                        child: TextFormField(
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
                              color: AppColors.secondaryColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                showPassword();
                              },
                              icon: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontSize: Dimensions.height16,
                              color: AppColors.secondaryColor
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    color: AppColors.secondaryColor,
                                    style: BorderStyle.solid,
                                    width: Dimensions.width3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: Dimensions.width3)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    width: Dimensions.width3,
                                    style: BorderStyle.solid,
                                    color: Colors.red.shade400)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(Dimensions.height13),
                                borderSide: BorderSide(
                                    width: Dimensions.width3,
                                    style: BorderStyle.solid,
                                    color: Colors.red.shade400)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height40,
                      ),
                      Obx(
                        () => SizedBox(
                            height: Dimensions.height50,
                            width: MediaQuery.of(context).size.width * 2 / 3,
                            child: ElevatedButton(
                                child: loading.isLoading()
                                    ? Text(
                                        "Signup",
                                        style: TextStyle(
                                            fontSize: Dimensions.height18, color: Colors.white),
                                      )
                                    : CircularProgressIndicator(
                                        color: AppColors.mainColor,
                                      ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    formController.createUser(
                                        _email, _password);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: AppColors.secondaryColor,
                                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(Dimensions.height23))))),
                      ),
                      SizedBox(height: Dimensions.height16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: Dimensions.height16, color: Colors.white),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.login);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: Dimensions.height20,
                                  color: Colors.deepOrange,
                                  fontFamily: "OrelegaOne"),
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
