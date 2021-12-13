import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final svgIcon;
  final bgColors;

  CustomIcon(this.svgIcon, this.bgColors);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: bgColors,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(svgIcon),
      ),
    );
  }
}
