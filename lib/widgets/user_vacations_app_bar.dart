import 'package:flutter/material.dart';

class UserVacationsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const UserVacationsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      elevation: 4,
      shadowColor: Colors.black26,
      backgroundColor: Colors.white,
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              'سفرهای من',
              style: TextStyle(
                fontFamily: 'Vazir',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward, color: Colors.black54),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
