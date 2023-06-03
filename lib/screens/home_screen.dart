import 'package:flutter/material.dart';

import 'package:alibaba/widgets/fly_button.dart';
import 'package:alibaba/widgets/travellers_number.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:alibaba/widgets/submit_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late int numberOfGrownups;
  late int numberOfKids;
  late int numberOfinfants;
  late int numberOfTravelers;

  @override
  void initState() {
    super.initState();
    numberOfGrownups = 1;
    numberOfKids = 0;
    numberOfinfants = 0;
    numberOfTravelers = 1;
  }

  void updateNumberOfTravelers(int numberOfTravelers) {
    setState(() {
      this.numberOfTravelers = numberOfTravelers;
    });
  }

  void updateNumberOfGrownups(int numberOfGrownups) {
    setState(() {
      this.numberOfGrownups = numberOfGrownups;
    });
  }

  void updateNumberOfKids(int numberOfKids) {
    setState(() {
      this.numberOfKids = numberOfKids;
    });
  }

  void updateNumberOfinfants(int numberOfinfants) {
    setState(() {
      this.numberOfinfants = numberOfinfants;
    });
  }

  var originCities = [
    'تهران',
    'مشهد',
    'اصفهان',
    'تبریز',
    'کیش',
    'شیراز',
  ];
  String? defaultOriginCity;

  var destinationCities = ['تهران', 'مشهد', 'اصفهان', 'تبریز', 'کیش', 'شیراز'];
  String? defaultDestinationCity;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 182,
                color: const Color(0xFFFDB713),
                child: Center(
                  child: Transform.translate(
                    offset: const Offset(0, 10),
                    child: const Text(
                      'پرواز',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Vazir',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 155,
              height: 50,
              left: 15,
              right: 15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FlyButton('پرواز خارجی'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0x05000000),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: SizedBox(
                            width: double.infinity,
                            child: DropdownButtonHideUnderline(
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: DropdownButton(
                                  icon: const Icon(Icons.place_outlined),
                                  isExpanded: true,
                                  items: destinationCities
                                      .map((city) => DropdownMenuItem(
                                            value: city,
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                city,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Vazir',
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (String? defaultCitySelected) {
                                    setState(() {
                                      defaultDestinationCity =
                                          defaultCitySelected!;
                                    });
                                  },
                                  value: defaultDestinationCity,
                                  hint: const Text(
                                    'مقصد',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Vazir',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            height: 1,
                            width: double.infinity,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey),
                            )),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: SizedBox(
                            width: double.infinity,
                            child: DropdownButtonHideUnderline(
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: DropdownButton(
                                  icon: const Icon(Icons.place_outlined),
                                  isExpanded: true,
                                  items: originCities
                                      .map((city) => DropdownMenuItem(
                                            value: city,
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                city,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Vazir',
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (String? defaultCitySelected) {
                                    setState(() {
                                      defaultOriginCity = defaultCitySelected!;
                                    });
                                  },
                                  value: defaultOriginCity,
                                  hint: const Text(
                                    'مبدا',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Vazir',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0x05000000),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: OutlinedButton.icon(
                                icon: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                label: const Text(
                                  "تاریخ برگشت",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Vazir',
                                    fontSize: 15,
                                  ),
                                ),
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide.none,
                                  backgroundColor: const Color(0x05000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            width: 1,
                            height: 45,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey),
                            )),
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: OutlinedButton.icon(
                                icon: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                label: const Text(
                                  "تاریخ رفت",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Vazir',
                                    fontSize: 15,
                                  ),
                                ),
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: const Color(0x05000000),
                                  side: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0x05000000),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: '$numberOfTravelers مسافر'.toPersianDigit(),
                        labelText: "مسافران",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: const TextStyle(
                          fontFamily: 'Vazir',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        labelStyle: const TextStyle(
                          fontFamily: 'Vazir',
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return TravellersNumber(
                              numberOfGrownups: numberOfGrownups,
                              numberOfKids: numberOfKids,
                              numberOfinfants: numberOfinfants,
                              numberOfTravelers: numberOfTravelers,
                              updateNumberOfTravelers: updateNumberOfTravelers,
                              updateNumberOfGrownups: updateNumberOfGrownups,
                              updateNumberOfKids: updateNumberOfKids,
                              updateNumberOfinfants: updateNumberOfinfants,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  const SubmitButton('جستجوی پرواز'),
                  const SizedBox(height: 15)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
