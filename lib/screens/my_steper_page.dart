import 'package:flutter/material.dart';

import '../widgets/custom_name_input.dart';

class MySteperPage extends StatefulWidget {
  @override
  _MySteperPageState createState() => _MySteperPageState();
}

class _MySteperPageState extends State<MySteperPage> {
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
          appBar: AppBar(
            backgroundColor: const Color(0xFFFDB713),
            actions: [
              currentStep < 5
                  ? const Text(
                      'صدور بلیط < ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  : IconButton(
                      icon: const Column(
                        children: [
                          Icon(Icons.upload_rounded),
                        ],
                      ),
                      color: currentStep > 4 ? Colors.green : Colors.black,
                      onPressed: () {},
                    ),
              currentStep < 4
                  ? const Text(
                      'پرداخت < ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  : IconButton(
                      icon: const Icon(
                        Icons.monetization_on,
                      ),
                      color: currentStep > 3 ? Colors.green : Colors.black,
                      onPressed: () {},
                    ),
              currentStep < 3
                  ? const Text(
                      'تایید اطلاعات < ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  : IconButton(
                      icon: const Icon(Icons.check),
                      color: currentStep > 2 ? Colors.green : Colors.black,
                      onPressed: () {},
                    ),
              currentStep < 2
                  ? const Text(
                      'مسافران < ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  : IconButton(
                      icon: const Icon(Icons.man),
                      color: currentStep > 1 ? Colors.green : Colors.black,
                      onPressed: () {},
                    ),
              currentStep < 1
                  ? const Text(
                      'صدور بلیط < ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  : IconButton(
                      icon: const Icon(Icons.airplane_ticket),
                      color: currentStep > 0 ? Colors.green : Colors.black,
                      onPressed: () {},
                    ),
            ],
          ),
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
                  const Column(
                    children: [
                      CustomNameInput(text: 'کد ملی'),
                      SizedBox(height: 15),
                      CustomNameInput(text: 'نام'),
                      SizedBox(height: 15),
                      CustomNameInput(text: 'نام خانوادگی'),
                    ],
                  ),
                //PassPort
                if (selectedGender == 1)
                  const Column(
                    children: [
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
            // padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: currentStep > 4 ? Colors.grey : Colors.black,
                  onPressed: () {
                    setState(() {
                      isCancelButtonPressed = true;
                      isNextButtonPressed = false;
                      currentStep != 5 ? currentStep++ : currentStep = 5;
                    });
                    // Handle cancel button press
                  },
                ),
                Text('$currentStep'),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  color: currentStep < 3 ? Colors.grey : Colors.black,
                  onPressed: () {
                    setState(() {
                      isNextButtonPressed = true;
                      isCancelButtonPressed = false;
                      currentStep != 2 ? currentStep-- : currentStep = 2;
                    });
                    // Handle next button press
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}