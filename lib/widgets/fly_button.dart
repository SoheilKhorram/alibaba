import 'package:flutter/material.dart';

class FlyButton extends StatefulWidget {
  const FlyButton(this.text, {super.key});

  final String text;

  @override
  State<FlyButton> createState() {
    return _FlyButtonState();
  }
}

class _FlyButtonState extends State<FlyButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: () {},
        child: Text(
          widget.text,
          style: const TextStyle(
            fontFamily: 'Vazir',
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
