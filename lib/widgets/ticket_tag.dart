import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tag extends StatelessWidget {
  Tag(this.text, {super.key});

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xfff8fafb),
        borderRadius: BorderRadius.circular(
            20.0), // Adjust the value as per your requirement
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontFamily: 'Vazir',
          color: Colors.black,
        ),
      ),
    );
  }
}
