import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class TicketAvalibility extends StatelessWidget {
  TicketAvalibility({
    super.key,
    this.price,
    this.numberOfRemainingSeats,
    this.isAvailable,
  });

  String? price;
  String? numberOfRemainingSeats;
  bool? isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Text(
            'تومان',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff959ea6),
              fontFamily: 'Vazir',
            ),
          ),
          const SizedBox(width: 4),
          Text(
            price!.toPersianDigit().seRagham(),
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Vazir',
              fontWeight: FontWeight.w900,
              color: Color(0xff0077db),
            ),
          ),
          const Spacer(),
          const Text(
            'صندلی باقی مانده',
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'Vazir',
              color: Color(0xffdc3545),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            numberOfRemainingSeats!.toPersianDigit(),
            style: const TextStyle(
              fontSize: 10,
              fontFamily: 'Vazir',
              color: Color(0xffdc3545),
            ),
          ),
        ],
      ),
    );
  }
}
