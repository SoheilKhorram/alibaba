import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import 'package:alibaba/widgets/flight_button.dart';
import 'package:alibaba/widgets/submit_button.dart';
import 'package:alibaba/widgets/travel_city.dart';
import 'package:alibaba/widgets/travel_date.dart';
import 'package:alibaba/widgets/traveler_input.dart';

class DatePickerButton extends StatefulWidget {
  final void Function(DateTime selectedDate)? onDateSelected;

  const DatePickerButton({Key? key, this.onDateSelected}) : super(key: key);

  String get text => "تاریخ برگشت";

  @override
  _DatePickerButtonState createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  DateTime? selectedDate;

  void _showDatePicker() async {
    var picked = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1385, 8),
      lastDate: Jalali(1450, 9),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked.toDateTime();
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(selectedDate!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _showDatePicker,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: OutlinedButton.icon(
          icon: const Icon(
            Icons.calendar_month_outlined,
            color: Colors.grey,
            size: 20,
          ),
          label: Text(
            widget.text,
            style: const TextStyle(
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
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  String? originCity;
  String? destinationCity;
  DateTime? selectedDate;

  void updateCity(String? city, String hintText) {
    setState(() {
      if (hintText == "مقصد") {
        destinationCity = city;
      } else {
        originCity = city;
      }
    });
  }

  void handleDateSelected(DateTime? selectedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FlyButton('پرواز خارجی'),
                    ],
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
                        TravelCity(updateCity: updateCity, hintText: "مبدا"),
                        const SizedBox(
                          height: 1,
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.grey),
                          ),
                        ),
                        TravelCity(updateCity: updateCity, hintText: "مقصد"),
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
                          child: DatePickerButton(
                            onDateSelected: handleDateSelected,
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                          height: 45,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.grey),
                          ),
                        ),
                        Expanded(child: TravelDate(text: "تاریخ رفت")),
                      ],
                    ),
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
      ),
    );
  }
}
