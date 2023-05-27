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
    numberOfKids = 0;
    numberOfinfants = 0;
  }

  void incrementGrownups(int numberOfGrownups) {
    setState(() {
      this.numberOfGrownups = numberOfGrownups + 1;
    });
  }

  void decrementGrownups(int numberOfGrownups) {
    setState(() {
      this.numberOfGrownups = numberOfGrownups - 1;
    });
  }

  void incrementKids(int numberOfKids) {
    setState(() {
      this.numberOfKids = numberOfKids + 1;
    });
  }

  void decrementKids(int numberOfKids) {
    setState(() {
      this.numberOfKids = numberOfKids - 1;
    });
  }

  void incrementInfants(int numberOfinfants) {
    setState(() {
      this.numberOfinfants = numberOfinfants + 1;
    });
  }

  void decrementInfants(int numberOfinfants) {
    setState(() {
      this.numberOfinfants = numberOfinfants - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'مسافران',
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                    onPressed: () {
                      incrementGrownups(numberOfGrownups!);
                    },
                    icon: const Icon(
                      Icons.add_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                  Text(
                    "$numberOfGrownups".toPersianDigit(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Vazir',
                    ),
                    locale: const Locale('fa'),
                  ),
                  IconButton(
                    onPressed: numberOfGrownups! <= 1
                        ? null
                        : () {
                            decrementGrownups(numberOfGrownups!);
                          },
                    icon: const Icon(
                      Icons.indeterminate_check_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'کودک (2 تا 12 سال)',
                    style: TextStyle(
                      fontFamily: 'Vazir',
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      incrementKids(numberOfKids!);
                    },
                    icon: const Icon(
                      Icons.add_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                  Text(
                    "$numberOfKids".toPersianDigit(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Vazir',
                    ),
                    locale: const Locale('fa'),
                  ),
                  IconButton(
                    onPressed: numberOfKids! <= 0
                        ? null
                        : () {
                            decrementKids(numberOfKids!);
                          },
                    icon: const Icon(
                      Icons.indeterminate_check_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'نوزاد (10 روز تا 2 سال)',
                    style: TextStyle(
                      fontFamily: 'Vazir',
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      incrementInfants(numberOfinfants!);
                    },
                    icon: const Icon(
                      Icons.add_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                  Text(
                    "$numberOfinfants".toPersianDigit(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Vazir',
                    ),
                    locale: const Locale('fa'),
                  ),
                  IconButton(
                    onPressed: numberOfinfants! <= 0
                        ? null
                        : () {
                            decrementInfants(numberOfinfants!);
                          },
                    icon: const Icon(
                      Icons.indeterminate_check_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "تایید و جستجو",
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
