import 'package:flutter/material.dart';

class FlyInfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FlyInfoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 150,
      elevation: 4,
      shadowColor: Colors.black26,
      backgroundColor: Colors.white,
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'اطلاعات پرواز',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Vazir',
                color: Colors.black,
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
