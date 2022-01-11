import 'package:flutter/material.dart';
class Friedrice extends StatelessWidget {
  const Friedrice({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        alignment: Alignment.center,
        child: const Text("fried rice page", style: TextStyle(
          color: Colors.white,
          fontSize: 25
    
        ),),
        
      ),
    );
  }
}