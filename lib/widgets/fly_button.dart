import 'package:flutter/material.dart';

const List<Widget> flies = [
  Text('پرواز خارجی'),
  Text('پرواز داخلی'),
];

class FlyButton extends StatefulWidget {
  const FlyButton(this.text, {super.key});

  final String text;

  @override
  State<FlyButton> createState() {
    return _FlyButtonState();
  }
}

class _FlyButtonState extends State<FlyButton> {
  final List<bool> _selectedFlies = [true, false];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 0,
          child: ToggleButtons(
            isSelected: _selectedFlies,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _selectedFlies.length; i++) {
                  _selectedFlies[i] = i == index;
                }
              });
            },
            constraints: const BoxConstraints(
              minHeight: 400.0,
              minWidth: 164,
            ),
            children: flies,
          ),
        ),
      ],
    );
  }
}