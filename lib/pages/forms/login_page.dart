import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/controllers/controllers.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/helpers/dimensions.dart';
import 'package:pedido/pages/forms/signup_page.dart';

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
              SizedBox(height: Dimensions.height30,),
              IconButton(
              padding: EdgeInsets.only(right: Dimensions.width320),
              onPressed: () {
                Get.back();
              },
              iconSize: Dimensions.height30,
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
              ),
            ),
              Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                  ),
                  padding: EdgeInsets.only(top: Dimensions.height10),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: Dimensions.height100,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                              color: AppColors.secondaryColor,
                                fontSize: Dimensions.height23, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: Dimensions.height40,
                          ),
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
                                    borderRadius: BorderRadius.circular(Dimensions.height13),
                                    borderSide: BorderSide(
                                        width: Dimensions.width3,
                                        style: BorderStyle.solid,
                                        color: AppColors.mainColor)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.height13),
                                    borderSide: BorderSide(
                                        width: Dimensions.width3,
                                        style: BorderStyle.solid,
                                        color: AppColors.secondaryColor)),
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
                            height: Dimensions.height20,
                          ),
                          SizedBox(
                            height: Dimensions.height60,
                            child: TextFormField(
                              validator: (input) {
                                if (input == null || input.isEmpty) {
                                  return "Please fill out this field";
                                }
                                if (!RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                                    .hasMatch(input)) {
                                  return "password must contain atleast one uppercase letter, a \nlowercase letter and a number ";
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
                                hintText: "Password",
                                hintStyle: TextStyle(
                              fontSize: Dimensions.height16,
                              color: AppColors.secondaryColor
                            ),
                                suffixIcon: IconButton(
                                  icon: Icon(_showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off, color: AppColors.secondaryColor,),
                                  onPressed: () {
                                    showPassword();
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.height13),
                                    borderSide: BorderSide(
                                        width: Dimensions.width3,
                                        style: BorderStyle.solid,
                                        color: AppColors.mainColor)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.height13),
                                    borderSide: BorderSide(
                                        width: Dimensions.width3,
                                        style: BorderStyle.solid,
                                        color:  AppColors.secondaryColor)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.height13),
                                    borderSide: BorderSide(
                                        width: Dimensions.width3,
                                        style: BorderStyle.solid,
                                        color: Colors.red.shade400)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Dimensions.height13),
                                    borderSide: BorderSide(
                                        width: 3,
                                        style: BorderStyle.solid,
                                        color: Colors.red.shade400)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //todo
                                },
                                child: Text(
                                  "forget password",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrange,
                                      fontSize: Dimensions.height16),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height16,
                          ),
                          Obx(() => SizedBox(
                              height: Dimensions.width50,
                              width: MediaQuery.of(context).size.width * 2 / 3,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: AppColors.secondaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(Dimensions.height23),
                                    )),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    formController.login(_email, _password);
                                  }
                                },
                                child:  loading.isLoading() ? Text(
                                  "Login",
                                  style: TextStyle(fontSize: Dimensions.height18, color: Colors.white),
                                ) : 
                                CircularProgressIndicator(color: AppColors.mainColor,),
                                )
                              ),
                            ),
                          SizedBox(height: Dimensions.height16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(fontSize: Dimensions.height16, color: Colors.white),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const SignupPage());
                                },
                                child: Text(
                                  "Signup",
                                  style: TextStyle(
                                      fontSize: Dimensions.height20,
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