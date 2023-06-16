import 'package:flutter/material.dart';

import 'custom_name_input.dart';

class AddPassenger extends StatefulWidget {
  const AddPassenger({super.key});

  @override
  _AddPassengerState createState() => _AddPassengerState();
}

class _AddPassengerState extends State<AddPassenger> {
  bool isNextButtonPressed = false;
  bool isCancelButtonPressed = false;
  int currentStep = 2;
  int selectedGender = 0; // 0 for "National Card", 1 for "PassPort"

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Radio(
                      value: 0,
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    const Text("کارت ملی"),
                    const SizedBox(width: 15),
                    Radio(
                      value: 1,
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    const Text("پاسپورت"),
                  ],
                ),
                const SizedBox(height: 15),
                const CustomNameInput(text: 'نام لاتین'),
                const SizedBox(height: 15),
                const CustomNameInput(text: 'نام خانوادگی لاتین'),
                const SizedBox(height: 15),
                // for National Card
                if (selectedGender == 0)
                  Column(
                    children: const [
                      CustomNameInput(text: 'کد ملی'),
                      SizedBox(height: 15),
                      CustomNameInput(text: 'نام'),
                      SizedBox(height: 15),
                      CustomNameInput(text: 'نام خانوادگی'),
                    ],
                  ),
                //PassPort
                if (selectedGender == 1)
                  Column(
                    children: const [
                      CustomNameInput(text: 'کشور محل تولد'),
                      SizedBox(height: 15),
                      // SizedBox(height: 15),
                      CustomNameInput(text: 'شماره پاسپورت'),
                    ],
                  ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                // ... bottom navigation bar icons
              ],
            ),
          ),
        ),
      ),
    );
  }
}
