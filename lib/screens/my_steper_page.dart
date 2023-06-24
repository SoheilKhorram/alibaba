import 'package:flutter/material.dart';

import 'package:alibaba/widgets/submit_button.dart';
import 'package:alibaba/widgets/stepper_app_bar.dart';
import 'package:alibaba/widgets/traveler_info_card.dart';

class MySteperPage extends StatefulWidget {
  const MySteperPage({super.key});

  @override
  _MySteperPageState createState() => _MySteperPageState();
}

class _MySteperPageState extends State<MySteperPage> {
  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        home: Scaffold(
          appBar: StepperAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: TravelerInfoCard(),
            ),
          ),
          bottomNavigationBar: Padding(
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
