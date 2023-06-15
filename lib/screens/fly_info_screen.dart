import 'package:flutter/material.dart';

import 'package:alibaba/widgets/fly_info_app_bar.dart';
import 'package:alibaba/widgets/airplane_logo.dart';
import 'package:alibaba/widgets/fly_info_line.dart';

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
              children: const [
                AirplaneLogo(),
                Line(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
