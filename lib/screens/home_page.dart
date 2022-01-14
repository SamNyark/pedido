import 'package:flutter/material.dart';
import 'package:pedido/widgets/account_screen.dart';
import 'package:pedido/widgets/cart_screen.dart';
import 'package:pedido/widgets/home_screen.dart';
import 'package:pedido/widgets/seller_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _currentIndex = 0;
  final tabView = [HomeScreen(), const SellerScreen(), const Cart(), AccountScreen()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabView[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xfff2f2f2),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 25,), label: "Home",
            backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_rounded, size: 25,), label: "Sellers"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, size: 25,), label: "Cart",),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, size: 25,), label: "Account")
          ],
        ),
      ),
    );
  }
}
