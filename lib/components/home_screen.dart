import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:pedido/components/food_categories.dart';
import 'package:pedido/components/home_screen_footer.dart';
import 'package:pedido/controllers/firebase_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _carousel = [
    "assets/images/friedrice.jpg",
    "assets/images/rice.jpg",
    "assets/images/waakye.jpg"
  ];
  double _index = 0;

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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                        ),
                        color: Colors.orange),
                    border: InputBorder.none,
                    //inner padding for the search box
                    contentPadding: const EdgeInsets.only(left: 10, bottom: 15),
                    hintText: "search",
                    hintStyle: const TextStyle(fontFamily: "Playfair")),
              ),
            ),
            const SizedBox(width: 60),
          ],
        ),
        const SizedBox(height: 20),

        /// for promos
        CarouselSlider(
            options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                height: 150,
                onPageChanged: (index, reason) {
                  setState(() {
                    _index = index.toDouble();
                  });
                }),
            items: [_carousel[0], _carousel[1], _carousel[2]].map((i) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  width: 550,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
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
          height: 5,
        ),
        DotsIndicator(
          dotsCount: _carousel.length,
          position: _index,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: Colors.orange,
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text("FOOD CATEGORIES",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "OrelegaOne",
                    color: Color(0xff494b4d))),
          ),
        ),
        const SizedBox(height: 10,),
        const FoodList(),
      ],
    );
  }
}
