import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

// ignore: must_be_immutable
class TicketAvalibility extends StatelessWidget {
  TicketAvalibility({
    super.key,
    this.price,
    required this.numberOfRemainingSeats,
  });

  int? price;
  int numberOfRemainingSeats;

  @override
  Widget build(BuildContext context) {
    if (numberOfRemainingSeats > 0) {
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
              price!.toString().toPersianDigit().seRagham(),
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
              numberOfRemainingSeats.toString().toPersianDigit(),
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Vazir',
                color: Color(0xffdc3545),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: const [
            Text(
              'تکمیل ظرفیت',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xffdc3545),
                fontFamily: 'Vazir',
              ),
            ),
          ],
        ),
      );
    }
  }
}
