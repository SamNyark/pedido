import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: const Color(0xfff2f2f2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.no_backpack, size: 60,),
          SizedBox(height: 10,),
          Text("Oops! NO item in cart", style: TextStyle(
            fontFamily: "Lora",
            fontSize: 20
          ),),
        ],
      ),
    );
  }
}