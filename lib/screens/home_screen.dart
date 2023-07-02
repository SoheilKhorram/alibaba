import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../widgets/date_picker.dart';
import '../widgets/fly_button.dart';
import '../widgets/submit_button.dart';
import '../widgets/travel_city.dart';
import '../widgets/traveler_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  String? originCity;
  String? destinationCity;
  Jalali? selectedDate;

  void updateCity(String? city, String hintText) {
    setState(() {
      if (hintText == "مقصد") {
        destinationCity = city;
      } else {
        originCity = city;
      }
    });
  }

  void selectDate(BuildContext context) async {
    final Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: selectedDate ?? Jalali.now(),
      firstDate: Jalali.now(),
      lastDate: Jalali(1420),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Container(
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
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0x05000000),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Column(
                    children: [
                      TravelCity(
                        updateCity: updateCity,
                        hintText: "مبدا",
                      ),
                      const SizedBox(
                        height: 1,
                        width: double.infinity,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.grey),
                        ),
                      ),
                      TravelCity(
                        updateCity: updateCity,
                        hintText: "مقصد",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                datePicker(
                  onDatesSelected: (Jalali date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
                const SizedBox(height: 25),
                const TravelerInput(),
                const Spacer(),
                const SubmitButton('جستجوی پرواز'),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
