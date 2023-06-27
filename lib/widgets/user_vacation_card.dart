import 'package:flutter/material.dart';

class UserVacationCard extends StatelessWidget {
  const UserVacationCard({
    super.key,
    required this.price,
    required this.orderNumber,
    required this.orderType,
    required this.date,
  });

  final String date;
  final int price;
  final int orderNumber;
  final String orderType;

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
            '$date:تاریخ',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Vazir',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$orderNumber:شماره سفارش',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Vazir',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$orderType:نوع سفارش',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Vazir',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$price:قیمت',
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
