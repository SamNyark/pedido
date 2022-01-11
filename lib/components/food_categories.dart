import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/helpers/products.dart';

Widget foodCategories(int x, int y, {page0, page1}){
    return Column(
      children :[ 
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        children: [
          GestureDetector(
            onTap: (){
              Get.to(page0);
            },
            child: Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                    height: 130,
                    width: 180,
                    child: Image.asset(
                      products[x].image,
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: 150,
                child: Text(products[x].title, style: const TextStyle(color: Color(0xff5c6166), fontFamily: "Playfair")))]),
          ),
            GestureDetector(
              onTap: (){
                Get.to(page1);
              },
              child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                      height: 130,
                      width: 180,
                      child: Image.asset(
                        products[y].image,
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(products[y].title, style: const TextStyle(color: Color(0xff5c6166), fontFamily: "Playfair")))
              ],
                    ),
            ),
        ]),
        const SizedBox(height: 20,)
      ]);
      
}