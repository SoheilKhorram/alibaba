import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class TicketTime extends StatelessWidget {
  const TicketTime({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Text(
      time.toPersianDigit(),
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Vazir',
      ),
    );
  }
}
