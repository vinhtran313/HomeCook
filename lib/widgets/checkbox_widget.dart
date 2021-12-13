import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  final ValueChanged<bool> callback;

  CheckBoxWidget({required this.callback});

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _checked = false;

  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.deepOrange;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(_getColor),
      value: _checked,
      onChanged: (bool? value) {
        widget.callback(value!);
        setState(() {
          _checked = value;
        });
      },
    );
  }
}
