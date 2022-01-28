import 'package:flutter/material.dart';

class Banku extends StatelessWidget {
  const Banku({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset("assets/images/gridBanku.jpg", fit: BoxFit.cover,),
          ),
          const SizedBox(height: 30,),
          const ListTile(
            trailing: Icon(Icons.favorite),
          )

        ],
      ),
    );
  }
}