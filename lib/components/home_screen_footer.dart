import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({ Key? key }) : super(key: key);

  final TextStyle footerStyle =
    const TextStyle(color: Colors.white, decoration: TextDecoration.underline, fontSize: 15, fontFamily: "Playfair");

  Widget detector({required String name, Function? ontapGesture}){
  return GestureDetector(
              onTap: () {
                ontapGesture!();
              },
              child: Text(
                name,
                style: footerStyle,
              ));
}

  @override
  Widget build(BuildContext context) {
    return Container(
    color: const Color(0xFF253042),
    height: 150,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {},
              child: Text(
                "About us",
                style: footerStyle,
              )),
          const SizedBox(
            height: 10,
          ),
          detector(
            name:"Terms and conditions",
            
            ),
          const SizedBox(
            height: 10,
          ),
          detector(
                name: "Billing Privacy",
              ),
          const SizedBox(
            height: 10,
          ),
          detector(
               name: "Security",
              ),
        ]),
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 20,
                    ),
                    tooltip: "facebook",
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.cyan[400],
                      size: 20,
                    ),
                    tooltip: "twitter",
                    onPressed: () {}),
                IconButton(
                    icon: Icon(FontAwesomeIcons.instagram,
                        color: Colors.red[400], size: 20),
                    tooltip: "instagram",
                    onPressed: () {}),
              ],
            ),
          ],
        ),
      ],
    ),
  );
  }
}


