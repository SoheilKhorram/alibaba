import 'package:flutter/material.dart';

import 'package:persian_number_utility/persian_number_utility.dart';

class TravellersNumber extends StatefulWidget {
  const TravellersNumber({super.key});

  @override
  State<TravellersNumber> createState() {
    return _TravellersNumberState();
  }
}

class _TravellersNumberState extends State<TravellersNumber> {
  int? numberOfGrownups;
  int? numberOfKids;
  int? numberOfinfants;

  @override
  void initState() {
    super.initState();
    numberOfGrownups = 1;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: Text('مسافران'),
              ),
              Row(
                children: [
                  const Text(
                    'بزرگسال  (12 سال به بالا)',
                    style: TextStyle(
                      fontFamily: 'Vazir',
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                  Text(
                    "$numberOfGrownups".toPersianDigit(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Vazir',
                    ),
                    locale: const Locale('fa'),
                  ),
                  IconButton(
                    onPressed: numberOfGrownups > 1 ? null : () {},
                    icon: const Icon(
                      Icons.indeterminate_check_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
