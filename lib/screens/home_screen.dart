import 'package:flutter/material.dart';

import 'package:alibaba/widgets/fly_button.dart';
import 'package:alibaba/widgets/travellers_number.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
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
              child: Transform.translate(
                offset: const Offset(0, 52),
                child: Container(
                  height: 130,
                  color: const Color(0xFFFDB713),
                  child: Center(
                    child: Transform.translate(
                      offset: const Offset(0, -10),
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
            ),
            Positioned(
              top: 155,
              left: 40,
              right: 40,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FlyButton('پرواز خارجی'),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: SizedBox(
                          width: 155,
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
                                defaultDestinationCity = defaultCitySelected!;
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
                      const SizedBox(width: 10),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: SizedBox(
                          width: 155,
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
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 160,
                              height: 40,
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
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              height: 40,
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
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return const TravellersNumber();
                        },
                      );
                    },
                    child: const Text("click"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
