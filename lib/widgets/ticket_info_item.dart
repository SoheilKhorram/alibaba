import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class TicketInfoItem extends StatelessWidget {
  const TicketInfoItem({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value.toPersianDigit(),
            style: const TextStyle(
              fontFamily: 'Vazir',
              fontSize: 16,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Vazir',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
