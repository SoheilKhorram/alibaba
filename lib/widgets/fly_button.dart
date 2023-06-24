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
  final List<bool> _selectedFlies = [false, true];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: _selectedFlies,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _selectedFlies.length; i++) {
            _selectedFlies[i] = i == index;
          }
        });
      },
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Vazir',
      ),
      fillColor: const Color(0xBD0078DB),
      selectedColor: Colors.white,
      color: Colors.black,
      borderColor: Colors.white,
      constraints: const BoxConstraints(
        minHeight: 400.0,
        minWidth: 189.2,
        maxWidth: double.infinity,
      ),
      children: flies,
    );
  }
}
