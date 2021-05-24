import 'package:flutter/material.dart';
import 'contants.dart';

class CardChild extends StatelessWidget {
  CardChild({this.cardIcon, this.cardText});
  final IconData cardIcon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            cardIcon,
            size: kIconSize,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            cardText,
            style: kTextStyle,
          ),
        ],
      ),
    );
  }
}
