import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/helpers/products.dart';
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
          margin: const EdgeInsets.only(left: 20, right: 10),
          padding: const EdgeInsets.only(bottom: 15),
          child: GestureDetector(
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage(products[index].image), fit: BoxFit.cover))),
                
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
                    ),
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(products[index].title, style: const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 16),maxLines: 1,),
                        const SizedBox(height: 8,),
                        Text("description"),
                        const SizedBox(height: 12,),
                        Row(children: const [
                          IconAndText(icon: Icons.location_on, text: "location"),
                          SizedBox(width: 10,),
                          IconAndText(icon: Icons.access_time_rounded, text: "time")
                        ],)

                      ],
                    ),
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
