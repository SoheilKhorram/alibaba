import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TravelInfoText extends StatelessWidget {
  TravelInfoText(
      {super.key,
      required this.transportationVehicle,
      required this.originCity,
      required this.destinationCity});

  String transportationVehicle;
  String originCity;
  String destinationCity;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$transportationVehicle $originCity به $destinationCity",
      style: const TextStyle(
        fontSize: 18,
        fontFamily: 'Vazir',
        color: Colors.black,
      ),
    );
  }
}
