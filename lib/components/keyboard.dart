import 'package:calculator/components/button.dart';
import 'package:calculator/components/button_row.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final Function(String) onKeyPressed;

  const Keyboard(this.onKeyPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: Column(
        children: [
          ButtonRow(
            children: [
              Button.expanded('AC', color: Button.DARK, onPressed: onKeyPressed),
              Button('%', color: Button.DARK, onPressed: onKeyPressed),
              Button.operation('/', onPressed: onKeyPressed),
            ],
          ),
          SizedBox(height: 1.0),
          ButtonRow(
            children: [
              Button('7', onPressed: onKeyPressed),
              Button('8', onPressed: onKeyPressed),
              Button('9', onPressed: onKeyPressed),
              Button.operation('x', onPressed: onKeyPressed),
            ],
          ),
          SizedBox(height: 1.0),
          ButtonRow(
            children: [
              Button('4', onPressed: onKeyPressed),
              Button('5', onPressed: onKeyPressed),
              Button('6', onPressed: onKeyPressed),
              Button.operation('-', onPressed: onKeyPressed),
            ],
          ),
          SizedBox(height: 1.0),
          ButtonRow(
            children: [
              Button('1', onPressed: onKeyPressed),
              Button('2', onPressed: onKeyPressed),
              Button('3', onPressed: onKeyPressed),
              Button.operation('+', onPressed: onKeyPressed),
            ],
          ),
          SizedBox(height: 1.0),
          ButtonRow(
            children: [
              Button.expanded('0', onPressed: onKeyPressed),
              Button('.', onPressed: onKeyPressed),
              Button.operation('=', onPressed: onKeyPressed),
            ],
          ),
        ],
      ),
    );
  }
}
