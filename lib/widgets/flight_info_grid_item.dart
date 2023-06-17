import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class FlightInfoGridItem extends StatelessWidget {
  const FlightInfoGridItem({
    super.key,
    required this.lebel,
    required this.info,
  });

  final String lebel;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lebel,
          style: const TextStyle(
            fontFamily: 'Vazir',
            fontSize: 14,
            color: Color(0xff6c7680),
          ),
        ),
        Text(
          info.toPersianDigit(),
          style: const TextStyle(
            fontFamily: 'Vazir',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xff2b2f33),
          ),
        ),
      ],
    );
  }
}
