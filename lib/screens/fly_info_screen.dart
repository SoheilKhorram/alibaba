import 'package:flutter/material.dart';

import 'package:alibaba/widgets/fly_info_app_bar.dart';
import 'package:alibaba/widgets/airplane_logo.dart';
import 'package:alibaba/widgets/fly_info_line.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class FlyInfoScreen extends StatelessWidget {
  const FlyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FlyInfoAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AirplaneLogo(),
                const Line(),
                Column(
                  children: [
                    Text(
                      '19:55'.toPersianDigit(),
                      style: const TextStyle(
                        fontFamily: 'Vazir',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 55),
                    Text(
                      '19:55'.toPersianDigit(),
                      style: const TextStyle(
                        fontFamily: 'Vazir',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'شیراز',
                      style: TextStyle(
                        fontFamily: 'Vazir',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'پنجشنبه, 15 تیر'.toPersianDigit(),
                      style: const TextStyle(
                        fontFamily: 'Vazir',
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'تهران',
                      style: TextStyle(
                        fontFamily: 'Vazir',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'پنجشنبه, 15 تیر'.toPersianDigit(),
                      style: const TextStyle(
                        fontFamily: 'Vazir',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
