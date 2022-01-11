import 'package:flutter/material.dart';

class Banku extends StatelessWidget {
  const Banku({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey,
        child: const Text("Banku", style: TextStyle(   
          color: Colors.white,
          fontSize: 25
        ),),
      ),
    );
  }
}