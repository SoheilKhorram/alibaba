import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xffbec6cc),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(
                  100), // Adjust the value as per your requirement
            ),
          ),
          Container(
            width: 136,
            height: 1,
            color: const Color(0xffbec6cc),
          ),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xffbec6cc),
              borderRadius: BorderRadius.circular(
                  100), // Adjust the value as per your requirement
            ),
          ),
        ],
      ),
    );
  }
}
