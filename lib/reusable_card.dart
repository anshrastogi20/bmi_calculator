import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  ReusableCard({this.colour = const Color(0xFFFFFFFF),required this.cardChild});
  final Color colour ;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}