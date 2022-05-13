import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/cart.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/helpers/dimensions.dart';
import 'package:pedido/widgets/big_text_and_small_text.dart';

import '../helpers/routes.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);

  CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    if (_cartController.totalQuantity == 0) {
      return SafeArea(child: Scaffold(
        body: Center(
          child: Container(
            height: Dimensions.height100*5,
            width: Dimensions.width100*2.5,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/empty-cart.png"), fit: BoxFit.cover)
            ),
          ),
        ),
      ));
    } else {
      return SafeArea(
        child: Scaffold(
            body: Stack(children: [
          Positioned(
            top: Dimensions.height20,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: Dimensions.height30,
                    width: Dimensions.width30,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height20),
                        color: AppColors.secondaryColor),
                    child: IconButton(
                      onPressed: (() {
                        Get.back();
                      }),
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width3,
                          vertical: Dimensions.height3),
                      icon: Icon(Icons.arrow_back),
                      iconSize: 25,
                      color: Colors.white,
                    )),
                Container(
                    height: Dimensions.height30,
                    width: Dimensions.width30,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height20),
                        color: AppColors.secondaryColor),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.initial);
                      },
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width2,
                          vertical: Dimensions.height4),
                      icon: Icon(Icons.home),
                      iconSize: 25,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height30 * 2,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: ListView.builder(
                itemCount: _cartController.items.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: Dimensions.height10),
                    child: Row(
                      children: [
                        Container(
                          height: Dimensions.height100,
                          width: Dimensions.width100,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(_cartController
                                      .getItems[index].image
                                      .toString()),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BigText(
                                      text: _cartController
                                          .getItems[index].title
                                          .toString()),
                                  IconButton(
                                    onPressed: () {
                                      _cartController.items.remove(
                                          _cartController
                                              .getItems[index].index);
                                    },
                                    icon: Icon(Icons.delete),
                                    color: AppColors.secondaryColor,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BigText(
                                      text: _cartController
                                          .getItems[index].price
                                          .toString()),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.height20),
                                          color: Colors.white54),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                _cartController.cartChange(
                                                    index, false);
                                              },
                                              icon: const Icon(Icons.remove)),
                                          SizedBox(
                                            width: Dimensions.width5,
                                          ),
                                          GetBuilder<CartController>(
                                              builder: (_) {
                                            return SmallText(
                                              text: _cartController
                                                  .getItems[index].quantity
                                                  .toString(),
                                              size: 20,
                                            );
                                          }),
                                          SizedBox(
                                            width: Dimensions.width5,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                _cartController.cartChange(
                                                    index, true);
                                              },
                                              icon: const Icon(Icons.add)),
                                        ],
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ])),
      );
    }
  }
}
