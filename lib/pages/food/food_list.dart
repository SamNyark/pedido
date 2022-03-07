import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/helpers/dimensions.dart';
import 'package:pedido/data/all_products.dart';
import 'package:pedido/helpers/routes.dart';
import 'package:pedido/pages/food/food_details.dart';
import 'package:pedido/widgets/big_text_and_small_text.dart';
import 'package:pedido/widgets/icon_and_text.dart';

class FoodList extends StatefulWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final Stream<QuerySnapshot> _stream = FirebaseFirestore.instance
      .collection("products")
      .doc("dvqOMIP97G6HWpcpSJeb")
      .collection("all_products")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
        if (!snapshots.hasData) {
          return CircularProgressIndicator();
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshots.data!.docs.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> allProducts =
                snapshots.data!.docs[index].data() as Map<String, dynamic>;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width17),
              padding: EdgeInsets.only(bottom: Dimensions.height16),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.foodDetailsPage(index));
                },
                child: Row(
                  children: [
                    FutureBuilder(
                      future: FirebaseStorage.instance
                          .ref("${allProducts['image']}")
                          .getDownloadURL(),
                      builder: (context, AsyncSnapshot<String> snapshots) {
                        if (!snapshots.hasData) {
                          return Container(
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.width30, vertical: Dimensions.height30),
                              height: Dimensions.height100,
                              width: Dimensions.width100,
                              child: CircularProgressIndicator(
                                color: AppColors.mainColor,
                              ));
                        }
                        return Container(
                            height: Dimensions.height100,
                            width: Dimensions.width100,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height20),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(snapshots.data.toString()),
                                    fit: BoxFit.cover)));
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width5),
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width10,
                          vertical: Dimensions.height16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.height16),
                              bottomLeft:
                                  Radius.circular(Dimensions.height16))),
                      width: Dimensions.width250,
                      height: Dimensions.height100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: allProducts['title'],
                            color: AppColors.secondaryColor,
                          ),
                          SizedBox(height: Dimensions.height10),
                          Expanded(
                            child: Row(
                              children: [
                                IconAndText(
                                  icon: Icons.location_on,
                                  text: "location",
                                  color: AppColors.locationIcon,
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                IconAndText(
                                  icon: Icons.access_time_rounded,
                                  text: "time",
                                  color: AppColors.timeIcon,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
