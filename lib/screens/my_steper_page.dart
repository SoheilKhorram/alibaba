import 'package:alibaba/widgets/stepper_app_bar.dart';
import 'package:alibaba/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_name_input.dart';

class MySteperPage extends StatefulWidget {
  const MySteperPage({super.key});

  @override
  _MySteperPageState createState() => _MySteperPageState();
}

class _MySteperPageState extends State<MySteperPage> {
  bool isNextButtonPressed = false;
  bool isCancelButtonPressed = false;
  int selectedGender = 0; // 0 for "National Card", 1 for "PassPort"

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        home: Scaffold(
          appBar: const StepperAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                      const Text(
                        "کارت ملی",
                        style: TextStyle(
                          fontFamily: 'Vazir',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Radio(
                        value: 1,
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                      const Text(
                        "پاسپورت",
                        style: TextStyle(
                          fontFamily: 'Vazir',
                        ),
                      ),
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
                        CustomNameInput(text: 'شماره پاسپورت'),
                      ],
                    ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const Padding(
            padding: EdgeInsets.all(12),
            child: SubmitButton(
              'تایید و ادامه خرید',
              backgroundColor: Color(0xFF0077db),
            ),
          ),
        ),
      ),
    );
  }
}
