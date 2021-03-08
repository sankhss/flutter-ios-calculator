import 'package:calculator/components/button.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final List<Button> children;

  const ButtonRow({@required this.children});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children.fold(<Widget>[], (buttons, button) {
          buttons.isEmpty ? buttons.add(button) : buttons.addAll([SizedBox(width: 1.0), button]);
          return buttons;
        }),
      ),
    );
  }
}
