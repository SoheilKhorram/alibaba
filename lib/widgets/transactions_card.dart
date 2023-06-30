import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class TransactionsCard extends StatelessWidget {
  const TransactionsCard({
    super.key,
    required this.date,
    required this.price,
    required this.digitalReceipt,
  });

  final String date;
  final int price;
  final String digitalReceipt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '$date    :تاریخ'.toPersianDigit(),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Vazir',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$price    :مبلغ'.toPersianDigit(),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Vazir',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$digitalReceipt    :رسید دیجیتالی'.toPersianDigit(),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Vazir',
            ),
          ),
        ],
      ),
    );
  }
}
