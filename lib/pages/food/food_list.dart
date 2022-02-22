import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/helpers/dimensions.dart';
import 'package:pedido/helpers/products.dart';
import 'package:pedido/pages/food/food_details.dart';
import 'package:pedido/widgets/big_text_and_small_text.dart';
import 'package:pedido/widgets/icon_and_text.dart';

class FoodList extends StatelessWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width17),
          padding: EdgeInsets.only(bottom: Dimensions.height16),
          child: GestureDetector(
            onTap: (){
              Get.to(const FoodDetails(), arguments: index);
            },
            
            child: Row(
              children: [
                Container(
                  height: Dimensions.height100,
                  width: Dimensions.width100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.height20),
                        image: DecorationImage(image: AssetImage(products[index].image), fit: BoxFit.cover))),
                
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width5),
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.height16), bottomLeft: Radius.circular(Dimensions.height16))
                  ),
                  width: Dimensions.width250,
                  height: Dimensions.height100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(text: products[index].title, color: AppColors.secondaryColor,),
                      SizedBox(height: Dimensions.height10),
                      Expanded(
                        child: Row(children: [
                          IconAndText(icon: Icons.location_on, text: "location", color: AppColors.locationIcon,),
                          SizedBox(width: Dimensions.width10,),
                          IconAndText(icon: Icons.access_time_rounded, text: "time", color: AppColors.timeIcon,)
                        ],),
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
  }
}
