import 'package:flutter/material.dart';

import 'package:persian_number_utility/persian_number_utility.dart';

class Dates extends StatelessWidget {
  const Dates({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date.toPersianDigit(),
      style: const TextStyle(
        fontSize: 13,
        fontFamily: 'Vazir',
        color: Colors.black54,
      ),
    );
  }
}
