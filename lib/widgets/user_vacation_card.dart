import 'package:flutter/material.dart';

class UserVactionCard extends StatelessWidget {
  const UserVactionCard({super.key});

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
        children: const [
          Text(
            ':تاریخ',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Vazir',
            ),
          ),
          SizedBox(height: 8),
          Text(
            ':شماره سفارش',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Vazir',
            ),
          ),
          SizedBox(height: 8),
          Text(
            ':نوع سفارش',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Vazir',
            ),
          ),
          SizedBox(height: 8),
          Text(
            ':قیمت',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Vazir',
            ),
          ),
        ],
      ),
    );
  }
}
