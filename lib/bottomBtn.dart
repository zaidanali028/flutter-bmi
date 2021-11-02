import 'package:flutter/material.dart';

class CalcBtn extends StatelessWidget {
  final btText;
  Function onTap;
  CalcBtn({@required this.btText, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Text(
            btText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.pink,
          ),
          height: 70),
    );
  }
}
