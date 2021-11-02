import 'package:flutter/material.dart';

class CardReuse extends StatelessWidget {
  final Color color;
  final width;
  final Widget cardChild;
  Function tapFunction;

  CardReuse({
    @required this.color,
    this.cardChild,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: cardChild,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(7),
        width: width);
  }
}
