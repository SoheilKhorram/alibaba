import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

// ignore: must_be_immutable
class TicketAvalibility extends StatelessWidget {
  TicketAvalibility({
    super.key,
    this.price,
    this.numberOfRemainingSeats,
    required this.isAvailable,
  });

  String? price;
  String? numberOfRemainingSeats;
  bool isAvailable;

  @override
  Widget build(BuildContext context) {
    if (isAvailable) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
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
