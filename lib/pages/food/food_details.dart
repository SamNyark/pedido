import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/cart.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/helpers/dimensions.dart';
import 'package:pedido/model/cart.dart';
import 'package:pedido/widgets/big_text_and_small_text.dart';
import 'package:pedido/widgets/details_collapse.dart';
import 'package:pedido/widgets/icon_and_text.dart';

class FoodDetails extends StatefulWidget {
  final int index;
  const FoodDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  final Stream<QuerySnapshot> _stream = FirebaseFirestore.instance
      .collection("products")
      .doc("dvqOMIP97G6HWpcpSJeb")
      .collection("all_products")
      .snapshots();

  String getCurrency() {
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: 'USD');
    return format.currencySymbol;
  }

  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    cartController.initQuantity();
    return SafeArea(
      child: StreamBuilder(
          stream: _stream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
            Map<String, dynamic> product = snapshots.data!.docs[widget.index]
                .data() as Map<String, dynamic>;
            DocumentSnapshot reff = snapshots.data!.docs[widget.index];
            return Scaffold(
              body: Stack(
                children: [
                  Positioned(
                    height: 300,
                    left: 0,
                    right: 0,
                    child: FutureBuilder(
                      future: FirebaseStorage.instance
                          .ref("${product['image']}")
                          .getDownloadURL(),
                      builder: (context, snapshots) {
                        return Hero(
                          tag: "identifier${widget.index}",
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                image: DecorationImage(
                                    image:
                                        NetworkImage(snapshots.data.toString()),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      },
                    ),
                  ),
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
                                  color:
                                      const Color.fromARGB(248, 255, 240, 240),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.height20)),
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
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.height20)),
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
                      top: 280,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimensions.height30),
                                topRight:
                                    Radius.circular(Dimensions.height30))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.all(Dimensions.height17),
                                child: BigText(text: product['title'])),
                            Container(
                                padding: EdgeInsets.only(
                                    left: Dimensions.width17,
                                    right: Dimensions.width30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Wrap(
                                            children: List.generate(
                                                5,
                                                (index) => Icon(
                                                      Icons.star,
                                                      color:
                                                          AppColors.mainColor,
                                                      size: Dimensions.height13,
                                                    ))),
                                        SizedBox(
                                          width: Dimensions.width5,
                                        ),
                                        SmallText(
                                          text: "5.0 rating",
                                          color: AppColors.secondaryColor,
                                        )
                                      ],
                                    ),
                                    IconAndText(
                                      icon: Icons.location_on,
                                      color: AppColors.locationIcon,
                                      text: product['location'],
                                    ),
                                    IconAndText(
                                        color: AppColors.timeIcon,
                                        icon: Icons.access_time_rounded,
                                        text: "time")
                                  ],
                                )),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width17,
                                  vertical: Dimensions.height17),
                              child: Text(
                                "Description",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: Dimensions.height23,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.secondaryColor),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width17),
                              child: Expanded(
                                child: SingleChildScrollView(
                                    child: DetailsCollapse(
                                        details: product['description'])),
                              ),
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
                height: Dimensions.height80,
                width: double.maxFinite,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        height: Dimensions.height50,
                        width: Dimensions.width100,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.height5),
                            color: Colors.white),
                        child: Center(
                            child: BigText(
                                text: "${getCurrency()}${product['price']}"))),
                    GestureDetector(
                      onTap: (() {
                        Get.bottomSheet(Container(
                          height: MediaQuery.of(context).size.height * 1 / 3,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Dimensions.height20),
                                  topRight:
                                      Radius.circular(Dimensions.height20))),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: -Dimensions.height30,
                                left: Dimensions.width10,
                                right: Dimensions.width10,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FutureBuilder(
                                      future: FirebaseStorage.instance
                                          .ref("${product['image']}")
                                          .getDownloadURL(),
                                      builder: (context, snapshots) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                              left: Dimensions.width10,
                                              top: Dimensions.height10),
                                          height: Dimensions.height100,
                                          width: Dimensions.width80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.height10),
                                              color: AppColors.secondaryColor,
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshots
                                                      .data
                                                      .toString()),
                                                  fit: BoxFit.cover)),
                                        );
                                      },
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: Icon(
                                          Icons.cancel_rounded,
                                          size: Dimensions.height30,
                                          color: AppColors.secondaryColor,
                                        ))
                                  ],
                                ),
                              ),
                              Positioned(
                                  bottom: Dimensions.height10,
                                  right: Dimensions.width30,
                                  left: Dimensions.width30,
                                  height: Dimensions.height50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.mainColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.height30)),
                                    child: TextButton(
                                        onPressed: (() {
                                          cartController.items.putIfAbsent(reff.id,
                                              () {
                                                //TODO
                                            return CartModel(
                                              title: product['title'],
                                              price: product['price'],
                                              isExit: true,
                                              time: DateTime.now().toString(),
                                              quantity: cartController.quantity
                                            );
                                          });
                                        }),
                                        child: const Text(
                                          "confirm",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        )),
                                  )),
                              Positioned(
                                left: Dimensions.width20,
                                bottom: Dimensions.height70,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          cartController.setQuantity(false);
                                        },
                                        icon: const Icon(Icons.remove)),
                                    SizedBox(
                                      width: Dimensions.width5,
                                    ),
                                    GetBuilder<CartController>(
                                      builder: (_) {
                                        return SmallText(
                                          text: cartController.quantity
                                              .toString(),
                                          size: 18,
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: Dimensions.width5,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          cartController.setQuantity(true);
                                        },
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                              ),
                              Positioned(
                                  left: Dimensions.width10,
                                  bottom: Dimensions.height120,
                                  child: const SmallText(
                                    text: "Amount you want to buy",
                                    size: 13,
                                  ))
                            ],
                          ),
                        ));
                      }),
                      child: Container(
                          margin: EdgeInsets.only(right: Dimensions.width20),
                          width: Dimensions.width120,
                          height: Dimensions.height50,
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height13)),
                          child: Center(
                              child: Text("Add to Cart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.height16)))),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
