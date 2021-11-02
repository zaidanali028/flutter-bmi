import 'package:flutter/material.dart';
import 'constants.dart';

class mOrfchild extends StatelessWidget {
  final IconData sexIcon;
  final String sexText;
  mOrfchild({@required this.sexIcon, @required this.sexText});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        sexIcon,
        color: Colors.white,
        size: 60.0,
      ),
      SizedBox(height: 10.0),
      Text(sexText, style: kSexStyle)
    ]);
  }
}
