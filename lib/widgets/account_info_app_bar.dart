import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class AccountInfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AccountInfoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('اطلاعات حساب کاربری'),
      toolbarHeight: 80,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 1,
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '09391679876'.toPersianDigit(),
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
                fontSize: 14,
                fontFamily: 'Vazir',
              ),
            ),
            Text(
              'موجودی: ۱۰۰۰۰۰ تومان'.toPersianDigit(),
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontFamily: 'Vazir',
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Image.asset(
          'assets/images/user.png',
          fit: BoxFit.contain,
          height: 45,
          width: 45,
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
