import 'package:get/get.dart';
import 'package:pedido/pages/food/food_details.dart';
import 'package:pedido/pages/home_page.dart';

class Routes {
  static String initial = "/";
  static String foodDetails = "/food-details";

  static String foodDetailsPage(int index) => "$foodDetails?index=$index";

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () {
          return HomePage();
        }),
    GetPage(
        name: foodDetails,
        page: () {
          var index = Get.parameters['index'];
          return FoodDetails(index: int.parse(index!));
        })
  ];
}
