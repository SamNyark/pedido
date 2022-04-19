import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedido/screens/forms/signup_page.dart';
import 'screens/home_page.dart';
import 'helpers/init_controller.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialBinding: InitDept(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
