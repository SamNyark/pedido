import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/controllers.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/helpers/dimensions.dart';
import 'package:pedido/widgets/big_text_and_small_text.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  FirebaseForm _formController = Get.find();
  Controllers _controllers = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            color: AppColors.secondaryColor,
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              size: Dimensions.height30,
            )),
        elevation: 0,
        backgroundColor: Colors.grey[50],
        title: SmallText(
          text: "Profile",
          color: AppColors.secondaryColor,
          size: 18,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Container(
                height: Dimensions.height50,
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(Dimensions.height30)),
                child: TextButton(
                  onPressed: () {
                    _formController.signOut();
                    _controllers.isLoggedIn(false);
                    Get.back();
                  },
                  child: const SmallText(
                    text: "Log out",
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.height20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    decoration: BoxDecoration(
                      color: AppColors.searchBoxColor,
                      borderRadius: BorderRadius.circular(Dimensions.height10)
                    ),
                    child: ListTile(
                      title: SmallText(text:"Username"),
                      subtitle: SmallText(text: "your username"),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    decoration: BoxDecoration(
                      color: AppColors.searchBoxColor,
                      borderRadius: BorderRadius.circular(Dimensions.height10)
                    ),
                    child: ListTile(
                      title: SmallText(text: "email"),
                      subtitle: SmallText(text: "your email",),
                    ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
