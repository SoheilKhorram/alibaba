import 'package:flutter/material.dart';

class TransactionsCard extends StatelessWidget {
  const TransactionsCard({super.key});

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
            '$date    :تاریخ',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Vazir',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$orderNumber    :شماره سفارش',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Vazir',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'نوع سفارش:    $orderType',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Vazir',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$price    :قیمت',
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
