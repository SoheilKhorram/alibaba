import 'package:flutter/material.dart';

import 'package:persian_number_utility/persian_number_utility.dart';

class Prices extends StatelessWidget {
  const Prices({super.key, required this.price});

  final int price;

  @override
  Widget build(BuildContext context) {
    return Text(
      price.toString().seRagham().toPersianDigit(),
      style: const TextStyle(
        fontSize: 15,
        fontFamily: 'Vazir',
        fontWeight: FontWeight.w500,
        color: Colors.green,
      ),
    );
  }
}
