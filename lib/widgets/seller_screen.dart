import 'package:flutter/material.dart';
import 'package:pedido/helpers/products.dart';

class SellerScreen extends StatelessWidget {
  const SellerScreen({ Key? key }) : super(key: key);

  Widget _container(int index, String description){
    return Column(
      children: [
        ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: const Color(0xff8b948d),
                  width: double.infinity,
                  height: 150,
                  child: Center(
                    child: Text(products[index].title, style: const TextStyle(
                      fontFamily: "Lora",
                      fontSize: 18,
                      color: Colors.white
                    ),),
                  ),

                  //child: Image.asset(products[index].image, fit: BoxFit.cover,)),
        )),
              const SizedBox(height: 40,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xfff2f2f2),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          children: [
            _container(0, products[0].title),
            _container(1, products[1].title),
            _container(2, products[2].title),
            _container(3, products[3].title),
            _container(4, products[4].title),
            _container(5, products[5].title),
            _container(6, products[6].title),
            _container(7, products[7].title)
          ]
        )
      ),
    );
  }
}