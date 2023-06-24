import 'package:flutter/material.dart';

import 'package:alibaba/widgets/submit_button.dart';
import 'package:alibaba/widgets/stepper_app_bar.dart';
import 'package:alibaba/widgets/traveler_info_card.dart';

class MySteperPage extends StatefulWidget {
  const MySteperPage({Key? key});

  @override
  _MySteperPageState createState() => _MySteperPageState();
}

class _MySteperPageState extends State<MySteperPage> {
  int itemCount = 1;

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
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: itemCount,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return const TravelerInfoCard(isDeletable: false);
                        }
                        return const TravelerInfoCard();
                      }),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            itemCount++;
                          });
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF0077db)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                color: Color(0xFF0077db),
                              ),
                            ),
                          ),
                        ),
                        icon: const Icon(Icons.add),
                        label: const Text(
                          'اضافه کردن مسافر جدید',
                          style: TextStyle(fontFamily: 'Vazir'),
                        ),
                      ),
                    ),
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
