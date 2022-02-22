import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/helpers/dimensions.dart';
import 'package:pedido/helpers/products.dart';
import 'package:pedido/widgets/big_text_and_small_text.dart';
import 'package:pedido/widgets/details_collapse.dart';
import 'package:pedido/widgets/icon_and_text.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              height: Dimensions.height250,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(products[Get.arguments].image),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              top: Dimensions.height40,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: Dimensions.height30,
                      width: Dimensions.width30,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(248, 255, 240, 240),
                          borderRadius:
                              BorderRadius.circular(Dimensions.height20)),
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: Dimensions.height20,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width3,
                            vertical: Dimensions.height3),
                      )),
                  Container(
                      height: Dimensions.height30,
                      width: Dimensions.height30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.height20)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart,
                          size: Dimensions.height20,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width3,
                            vertical: Dimensions.height3),
                      )),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.height235,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.height20),
                        topRight: Radius.circular(Dimensions.height20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.all(Dimensions.height17),
                        child: BigText(text: products[Get.arguments].title)),
                    Container(
                        padding: EdgeInsets.only(
                            left: Dimensions.width17,
                            right: Dimensions.width30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Wrap(
                                    children: List.generate(
                                        5,
                                        (index) => Icon(
                                              Icons.star,
                                              color: AppColors.mainColor,
                                              size: Dimensions.height13,
                                            ))),
                                SizedBox(
                                  width: Dimensions.width5,
                                ),
                                SmallText(text: "5.0 rating", color: AppColors.secondaryColor,)
                              ],
                            ),
                            IconAndText(
                              icon: Icons.location_on,
                              color: AppColors.locationIcon,
                              text: "location",
                            ),
                            IconAndText(
                              color: AppColors.timeIcon,
                                icon: Icons.access_time_rounded, text: "time")
                          ],
                        )),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width17, vertical: Dimensions.height17),
                      child: Text("Description", style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: Dimensions.height23,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor

                      ),),
                    ),
                    const Expanded(
                      child: SingleChildScrollView(
                          child: DetailsCollapse(
                              details:
                                  "jfdsfdfosfidshfhdfiho fs j a afidf  dfid afai fsa adfaf jfdsfdfosfidshfhdfiho fs j a afidf  dfid afai fsa adfaf jfdsfdfosfidshfhdfiho fs j a afidf  dfid afai fsa adfaf jfdsfdfosfidshfhdfiho fs j a afidf  dfid afai fsa adfaf jfdsfdfosfidshfhdfiho fs j a afidf  dfid afai fsa adfaf jfdsfdfosfidshfhdfiho fs j a afidf  dfid afai fsa adfaf jfdsfdfosfidshfhdfiho fs j a afidf  dfid afai fsa adfaf jfdsfdfosfidshfhdfiho fs j a afidf  dfid afai fsa adfaf dshfhdfiho fs j a afidf  dfid afai fsa adfaf jfdsfdfosfidshfhdfiho dshfhdfiho fs j a afidf  dfid afai fsa adfaf jfdsfdfosfidshfhdfiho dshfhdfiho fs j a afidf  dfid afai fsa adfaf jfdsfdfosfidshfhdfiho dshfhdfiho fs j a afidf  dfid afai fsa adfaf jfdsfdfosfidshfhdfiho dshfhdfiho fs j a afidf  dfid afai fsa adfaf jfdsfdfosfidshfhdfiho dshfhdfiho fs j a afidf  dfid afai fsa adfaf jfdsfdfosfidshfhdfiho")),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    )
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height100,
        width: double.maxFinite,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              height: Dimensions.height50,
              width: Dimensions.width120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height5), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                  const BigText(text: "0"),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: Dimensions.width20),
                width: Dimensions.width100,
                height: Dimensions.height50,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.height13)),
                child:   Center(child: Text("Add to Cart", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.height16

                )))),
          ],
        ),
      ),
    );
  }
}
