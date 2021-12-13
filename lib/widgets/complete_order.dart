import 'package:flutter/material.dart';

class CompleteOrderContent extends StatelessWidget {
  final IconData icon;
  final String description;
  CompleteOrderContent(this.icon, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 150,
            color: Colors.orange[800],
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
