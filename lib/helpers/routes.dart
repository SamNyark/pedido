import 'package:get/get.dart';
import 'package:pedido/pages/food/food_details.dart';
import 'package:pedido/pages/forms/login_page.dart';
import 'package:pedido/pages/forms/profile_page.dart';
import 'package:pedido/pages/forms/reset_password_page.dart';
import 'package:pedido/pages/forms/signup_page.dart';
import 'package:pedido/pages/home_page.dart';

import '../screens/account_screen.dart';
import '../screens/cart_screen.dart';

class Routes {
  static String initial = "/";
  static String foodDetails = "/food-details";
  static String signUp = "/sign-up";
  static String login = "/login";
  static String forgetPassword = "/forget-password";
  static String account = "/account";
  static String profile = "/profile";
  static String cart = "/cart";

  static String foodDetailsPage(int index) => "$foodDetails?index=$index";

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () {
          return const HomePage();
        }),
    GetPage(
        name: foodDetails,
        transition: Transition.fade,
        page: () {
          var index = Get.parameters['index'];
          return FoodDetails(index: int.parse(index!));
        }),
    GetPage(
        name: signUp,
        page: () => const SignupPage(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: forgetPassword, page: () => ResetPassword()),
    GetPage(name: account, page: () => AccountScreen()),
    GetPage(
        name: profile,
        page: () => Profile(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500)),
        GetPage(name: cart, page: () => Cart())
  ];
}
