import 'package:flutter/material.dart';
import 'package:pedido/helpers/colors.dart';
import 'package:pedido/widgets/big_text_and_small_text.dart';

class DetailsCollapse extends StatefulWidget {
  final String details;

  const DetailsCollapse({Key? key, required this.details}) : super(key: key);

  @override
  _DetailsCollapseState createState() => _DetailsCollapseState();
}

class _DetailsCollapseState extends State<DetailsCollapse> {
  double height = 400;
  bool hiddenText = true;
  late String firstHalf;
  late String secondHalf;

  @override
  void initState() {
    if (widget.details.length > height) {
      firstHalf = widget.details.substring(0, height.toInt());
      secondHalf =
          widget.details.substring(height.toInt() + 1, widget.details.length);
    } else {
      firstHalf = widget.details;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  SmallText(
                      color: AppColors.secondaryColor,
                      text: hiddenText
                          ? firstHalf + " ..."
                          : firstHalf + secondHalf),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                            color: AppColors.mainColor,
                            text: hiddenText ? "show more" : "show less"),
                        Icon(hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up, color: AppColors.mainColor)
                      ],
                    ),
                  )
                ],
              ),
            )
          : SmallText(text: widget.details),
    );
  }
}
