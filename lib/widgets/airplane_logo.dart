import 'package:flutter/material.dart';

class AirplaneLogo extends StatelessWidget {
  const AirplaneLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/IR.png',
          width: 38,
          height: 38,
        ),
        const SizedBox(height: 20),
        const Text(
          'ایران ایر',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Vazir',
          ),
        ),
      ],
    );
  }
}
