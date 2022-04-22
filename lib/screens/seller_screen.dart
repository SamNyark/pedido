import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pedido/helpers/dimensions.dart';
import 'package:firebase_storage/firebase_storage.dart';



class SellerScreen extends StatelessWidget {
  const SellerScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("collectionPath").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          return ListView.builder(itemCount: 10, itemBuilder: (context, index){
          return Column(
            children: [
              Container(
                height: Dimensions.height100,
                width: Dimensions.width200,
                color: Colors.blue,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assetName"))
                ),
              ),
      
            ],
          );
        });
        },
        
      ),
    );
  }
}