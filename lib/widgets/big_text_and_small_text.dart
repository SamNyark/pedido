import 'package:flutter/material.dart';
import 'package:pedido/helpers/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  const BigText({Key? key, required this.text, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontSize: Dimensions.height23,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final double height;
  const SmallText({ Key? key, required this.text, this.color = const Color(0xff000000), this.size = 15, this.height = 1.5 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: TextStyle(
        fontSize: size,
        color: color,
        height: height
      ),
    );
  }
}

