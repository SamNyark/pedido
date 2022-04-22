import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/controllers.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/helpers/dimensions.dart';
import 'package:pedido/helpers/routes.dart';
import 'package:pedido/widgets/big_text_and_small_text.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  final FirebaseForm _formController = Get.find();
  final Controllers _controllers = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx((() => 
          Stack(
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: Dimensions.height60,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(Dimensions.height50),
                                bottomRight: Radius.circular(Dimensions.height50))),
                      )),
                  Positioned(
                      top: Dimensions.height30,
                      left: Dimensions.width60,
                      right: Dimensions.width60,
                      height: Dimensions.height50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: AppColors.secondaryColor,
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.height50))),
                          onPressed: () {
                            if(_controllers.isLoggedIn() == false){
                              Get.toNamed(Routes.signUp);
                            }
                          },
                          child: BigText(text: _controllers.isLoggedIn() ? "Welcome" : "sign up / login",))),
                
              Positioned(
                top: Dimensions.height120,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Profile"),
                    iconColor: AppColors.secondaryColor,
                    textColor: AppColors.secondaryColor,
                  ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text("Payment"),
                    iconColor: AppColors.secondaryColor,
                    textColor: AppColors.secondaryColor,
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    iconColor: AppColors.secondaryColor,
                    textColor: AppColors.secondaryColor,
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("About"),
                    iconColor: AppColors.secondaryColor,
                    textColor: AppColors.secondaryColor,
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: Text("Help"),
                    iconColor: AppColors.secondaryColor,
                    textColor: AppColors.secondaryColor,
                  ),
                  ListTile(
                    onTap: (){
                      _formController.signOut();
                      _controllers.isLoggedIn(false);
                    },
                    iconColor: AppColors.secondaryColor,
                    textColor: AppColors.secondaryColor,
                    title: _controllers.isLoggedIn() ? Text("log out") : null,
                    leading: _controllers.isLoggedIn() ? Icon(Icons.logout): null,
                  )
                ],
              ))
              
            ],
          )),
        ),
      ),
    );
  }
}
