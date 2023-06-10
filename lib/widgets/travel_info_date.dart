import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TravelInfoDate extends StatelessWidget {
  TravelInfoDate({super.key, required this.date});

  String date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: 'Vazir',
        color: Colors.black45,
      ),
    );
  }
}
