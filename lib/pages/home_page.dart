import 'package:flutter/material.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/helpers/dimensions.dart';
import 'package:pedido/screens/home_screen.dart';
import '../screens/account_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/seller_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _currentIndex = 0;
  final tabView = [const HomeScreen(), const SellerScreen(), const Cart(), AccountScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabView[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: AppColors.secondaryColor,
        selectedItemColor: AppColors.mainColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: Dimensions.bottomIconSize,), label: "Home",
          backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded, size: Dimensions.bottomIconSize,), label: "Sellers"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: Dimensions.bottomIconSize,), label: "Cart",),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, size: Dimensions.bottomIconSize,), label: "Account")
        ],
      ),
    );
  }
}
