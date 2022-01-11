import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedido/controllers/firebase_form.dart';
import 'package:pedido/helpers/init_controller.dart';
import 'package:pedido/screens/forms/signup_page.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  Widget detector({icons, name, Function? onTapGesture}) {
    return GestureDetector(
        onTap: () {
          onTapGesture!();
        },
        child: Column(
          children: [
            Icon(
              icons,
              color: Colors.grey,
              size: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: const TextStyle(
                color: Color(0xff6b6e73),
                fontFamily: "Playfair"
              ),
            )
          ],
        ));
  }

  Widget listTile({icons, name, Function? onTapGesture}) {
    return ListTile(
      leading: Icon(icons, size: 25, color: Colors.grey),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 18,
          color: Color(0xff4a4c4f),
          fontFamily: "Playfair"
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          decoration: const BoxDecoration(color: Color(0xffe1e6e3)),
          child: ListView(children: [
            Stack(children: [
          Container(
            height: 100,
          ),
          Container(
            height: 60,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: Colors.orange),
          ),
          Positioned(
            left: 100,
            right: 100,
            height: 50,
            top: 30,
            child: GestureDetector(
              onTap: () { Get.to(SignupPage());},
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xfff2f2f2),
                  borderRadius: BorderRadius.circular(15)
            
                ),
                child: const Text("REGISTER/LOGIN",
                    style: TextStyle(
                      color: Color(0xff2d2e30), fontSize: 16, fontFamily: "SourceCode")),
              ),
            ),
          )
            ]),
            Container(
              height: 120,
              color: const Color(0xfff2f2f2),
              child: Column(
                children: [
                   Container(
                     padding: const EdgeInsets.only(left: 40),
                     alignment: Alignment.topLeft,
                     child: const Text("My Orders", style: TextStyle(fontSize: 18, fontFamily: "OrelegaOne",))),
                   const SizedBox(height: 20,),
                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    detector(
                        name: "In transit",
                        icons: FontAwesomeIcons.motorcycle),
                    detector(name: "Pending \nFeedback", icons: Icons.chat),
                    detector(
                        name: "Return & \nRefund",
                        icons: FontAwesomeIcons.undo),
                  ],
                )

                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 120,
              color: const Color(0xfff2f2f2),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 40),
                     alignment: Alignment.topLeft,
                    child: const Text(
                "My Profile",
                style: TextStyle(fontSize: 18, fontFamily: "OrelegaOne"),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    detector(name: "   Reset \nPassword", icons: Icons.redo),
                    detector(name: "Verify \nMobile", icons: Icons.phone),
                    detector(name: "Verify \nEmail", icons: Icons.email),
                  ])],
              ),
            ),
            const SizedBox(
          height: 20,
            ),
            Column(children: [
          listTile(
              icons: FontAwesomeIcons.storeAlt, name: "Sellers followed"),
          listTile(name: "Recently viewed", icons: FontAwesomeIcons.history),
          listTile(name: "Wishlist", icons: FontAwesomeIcons.heart),
          listTile(
              icons: Icons.location_on_rounded, name: "Address management"),
          listTile(name: "Contact Rider", icons: Icons.contact_phone),
          listTile(name: "Return policy", icons: Icons.read_more),
          listTile(name: "About us", icons: FontAwesomeIcons.addressCard)
            ])
          ])),
    );
  }
}
