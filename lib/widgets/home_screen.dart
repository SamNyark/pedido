import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:pedido/components/food_categories.dart';
import 'package:pedido/components/home_screen_footer.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/screens/food/banku.dart';
import 'package:pedido/screens/food/fried_rice.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({Key? key}) : super(key: key);

   final List _carousel = [
    "assets/images/friedrice.jpg",
    "assets/images/rice.jpg",
    "assets/images/waakye.jpg"
  ];
  FirebaseForm formController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
       const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGO",
              style:
                  TextStyle(color: Colors.orange.withOpacity(.8), fontSize: 18),
            ),
            const SizedBox(width: 20),
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.2)),
              width: 200,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      onPressed: () {
                        formController.signOut();
                      },
                      icon: const Icon(
                        Icons.search,
                      ),
                      color: Colors.orange),
                  border: InputBorder.none,
                  //inner padding for the search box
                  contentPadding: const EdgeInsets.only(left: 10, bottom: 15),
                  hintText: "search",
                  hintStyle: const TextStyle(fontFamily: "Playfair")
                ),
              ),
            ),
            const SizedBox(width: 60),
          ],
        ),
        const SizedBox(height: 20),

        /// for promos
        CarouselSlider(
            options: CarouselOptions(
              autoPlayAnimationDuration: const Duration(seconds: 1),
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              height: 130,
            ),
            items: [_carousel[0], _carousel[1], _carousel[2]].map((i) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  width: 600,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text("FOOD CATEGORIES",
                style: TextStyle(fontSize: 20, fontFamily: "OrelegaOne", color: Color(0xff494b4d))),
          ),
        ),
        foodCategories(0, 1, page0: const Banku(), page1: const Friedrice()),
        foodCategories(2, 3),
        foodCategories(4, 5),
        foodCategories(6, 7),
        const Footer()
      ],
    );
  }
}
