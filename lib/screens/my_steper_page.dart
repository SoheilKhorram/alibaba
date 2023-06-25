import 'package:alibaba/widgets/traveler_info_card_list.dart';
import 'package:flutter/material.dart';

import 'package:alibaba/widgets/submit_button.dart';
import 'package:alibaba/widgets/stepper_app_bar.dart';

class MySteperPage extends StatefulWidget {
  const MySteperPage({super.key});

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
                children: const [
                  TravelerInfoCardList(),
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
