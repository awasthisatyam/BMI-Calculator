import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardWidget, this.onPress});
  final Color colour;
  final Widget cardWidget;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
          child: cardWidget,
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.all(10.0),
        ));
  }
}
