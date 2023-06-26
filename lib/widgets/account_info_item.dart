import 'package:flutter/material.dart';

class AccountInfoItem extends StatelessWidget {
  const AccountInfoItem({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: label,
                style: const TextStyle(
                  fontFamily: 'Vazir',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            const TextSpan(text: "        "),
            WidgetSpan(
                child: Icon(
              icon,
              size: 25,
              color: Colors.black,
            )),
          ],
        ),
      ),
    );
  }
}
