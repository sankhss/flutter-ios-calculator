import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1.0);
  static const DARK = Color.fromRGBO(82, 82, 82, 1.0);
  static const OPERATION = Color.fromRGBO(250, 158, 13, 1.0);

  final String label;
  final bool expanded;
  final Color color;
  final void Function(String) onPressed;

  const Button(
    this.label, {
    this.expanded = false,
    this.color = DEFAULT,
    @required this.onPressed,
  });

  const Button.expanded(
    this.label, {
    this.expanded = true,
    this.color = DEFAULT,
    @required this.onPressed,
  });

  const Button.operation(
    this.label, {
    this.expanded = false,
    this.color = OPERATION,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: this.expanded ? 2 : 1,
      child: RaisedButton(
        elevation: 0.0,
        color: this.color,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.w200,
          ),
        ),
        onPressed: () => onPressed(this.label),
      ),
    );
  }
}
