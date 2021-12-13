import 'package:flutter/material.dart';

class DialogIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          new CircularProgressIndicator(),
          new Text("Loading"),
        ],
      ),
    );
  }
}
