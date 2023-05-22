import 'package:flutter/material.dart';

class FlyButton extends StatelessWidget {
  const FlyButton(this.text, {super.key});

  final String text;

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
          text,
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
