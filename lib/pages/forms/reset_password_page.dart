import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/helpers/dimensions.dart';
import 'package:pedido/widgets/big_text_and_small_text.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);
  String? _email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<FirebaseForm>(builder: (formController) {
      return Column(children: [
        SizedBox(
          height: Dimensions.height30,
        ),
        IconButton(
            padding: EdgeInsets.only(right: Dimensions.width320),
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
            SizedBox(height: Dimensions.height100,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width50),
          child: Form(
            key: _formKey,
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
                    color: AppColors.secondaryColor),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.height13),
                    borderSide: BorderSide(
                        width: Dimensions.width3,
                        style: BorderStyle.solid,
                        color: AppColors.secondaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.height13),
                    borderSide: BorderSide(
                        width: Dimensions.width3,
                        style: BorderStyle.solid,
                        color: AppColors.mainColor)),
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
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        SizedBox(
            height: Dimensions.height50,
            width: Dimensions.width250,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height20))),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    formController.passwordReset(_email!);
                  }
                },
                child: const BigText(
                  text: "Reset",
                )))
      ]);
    }));
  }
}
