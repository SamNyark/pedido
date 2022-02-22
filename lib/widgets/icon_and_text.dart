import 'package:flutter/material.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/helpers/dimensions.dart';
import 'package:pedido/widgets/big_text_and_small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double iconSize;
  final String text;
  const IconAndText({ Key? key, required this.icon, required this.text, this.color = Colors.black, this.iconSize = 20 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: iconSize, color: color,),
        SizedBox(width: Dimensions.width3,),
        Text(text, style: TextStyle(fontSize: 16, fontFamily: "Lora", color: AppColors.secondaryColor),)
      ],
    );
  }
}