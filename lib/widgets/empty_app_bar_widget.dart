import 'package:flutter/material.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  dynamic customColors = Colors.white;
  final double height;
  EmptyAppBar(this.customColors, [this.height = 0]);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: customColors,
      height: height,
    );
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}
