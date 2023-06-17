import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24, left: 16),
      child: Column(
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
            width: 1,
            height: 85,
            color: const Color(0xffbec6cc),
          ),
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffbec6cc),
                width: 1,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  100), // Adjust the value as per your requirement
            ),
          ),
        ],
      ),
    );
  }
}
