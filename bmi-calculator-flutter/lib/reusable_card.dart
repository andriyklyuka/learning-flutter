import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableIcon extends StatelessWidget {
  final IconData iconData;
  final String text;

  ReusableIcon({@required this.iconData, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.iconData,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.text,
          style: kTextStyle,
        ),
      ],
    );
  }
}
