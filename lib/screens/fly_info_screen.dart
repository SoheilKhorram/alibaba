import 'package:alibaba/widgets/flight_info_grid_item.dart';
import 'package:alibaba/widgets/submit_button.dart';
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
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 24, bottom: 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
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
            ),
            const SizedBox(height: 32),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Expanded(
                child: GridView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2,
                    crossAxisCount: 3,
                  ),
                  children: const [
                    FlightInfoGridItem(lebel: 'شماره پرواز', info: '23453'),
                    FlightInfoGridItem(lebel: 'هواپیما', info: 'ERJ'),
                    FlightInfoGridItem(lebel: 'ترمینال', info: '7'),
                    FlightInfoGridItem(lebel: 'پرواز', info: 'اکونومی'),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0x12000000),
              thickness: 1,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'تومان  ',
                      style: TextStyle(
                        fontFamily: 'Vazir',
                        fontSize: 11,
                        color: Color(0xff4b5259),
                      ),
                    ),
                    Text(
                      '1200000'.toPersianDigit().seRagham(),
                      style: const TextStyle(
                        fontFamily: 'Vazir',
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Color(0xff0077db),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'مجموع قیمت',
                      style: TextStyle(
                        fontFamily: 'Vazir',
                        fontSize: 14,
                        color: Color(0xff959ea6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const SubmitButton(
                  'انتخاب بلیط و ادامه',
                  color: Color(0xff0077db),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
