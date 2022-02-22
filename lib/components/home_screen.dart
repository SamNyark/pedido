import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:pedido/pages/food/food_list.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/helpers/dimensions.dart';

import '../helpers/products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _index = 0;

  FirebaseForm formController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: Dimensions.width20),
              child: Text(
                "LOGO",
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: Dimensions.height18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.height10),
              padding: EdgeInsets.only(top: Dimensions.height4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.searchBoxColor),
              width: Dimensions.width200,
              height: Dimensions.height40,
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        padding: EdgeInsets.symmetric(vertical: Dimensions.width5),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_outlined,
                        ),
                        color: AppColors.mainColor),
                    border: InputBorder.none,
                    //inner padding for the search box
                    contentPadding: EdgeInsets.only(left: Dimensions.width10, bottom: Dimensions.height17),
                    hintText: "search",
                    hintStyle: const TextStyle(fontFamily: "Playfair")),
              ),
            ),
            SizedBox(width: Dimensions.width60),
          ],
        ),
        SizedBox(height: Dimensions.height20),

        /// for promos
        CarouselSlider(
            options: CarouselOptions(
              autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                height: Dimensions.height150,
                onPageChanged: (index, reason) {
                  setState(() {
                    _index = index.toDouble();
                  });
                }),
            items: [carousel[0], carousel[1], carousel[2]].map((i) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: AssetImage(i),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              });
            }).toList()),
        SizedBox(
          height: Dimensions.height5,
        ),
        DotsIndicator(
          dotsCount: carousel.length,
          position: _index,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: AppColors.mainColor,
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.height10),
            child: Text("FOOD CATEGORIES",
                style: TextStyle(
                    fontSize: Dimensions.height20,
                    fontFamily: "OrelegaOne",
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff494b4d))),
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        const FoodList(),
      ],
    );
  }
}
