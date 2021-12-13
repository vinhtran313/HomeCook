import 'package:boilerplate/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onPress;
  final Color buttonColor;

  CustomButton(
      {required this.title,
      required this.onPress,
      this.buttonColor = Colors.deepOrange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RoundedButtonWidget(
        buttonText: title,
        buttonColor: buttonColor,
        textColor: Colors.white,
        onPressed: onPress,
      ),
    );
  }
}
