import 'package:flutter/material.dart';

List<String> cities = <String>[
  'تهران',
  'مشهد',
  'اصفهان',
  'تبریز',
  'کیش',
  'شیراز'
];

// ignore: must_be_immutable
class TravelCity extends StatefulWidget {
  TravelCity({
    super.key,
    required this.updateCity,
    required this.hintText,
  });

  Function(String?, String) updateCity;
  String hintText;

  @override
  State<TravelCity> createState() {
    return _TravelCityState();
  }
}

class _TravelCityState extends State<TravelCity> {
  String? defaultCity;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        width: double.infinity,
        child: DropdownButtonHideUnderline(
          child: SizedBox(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton<String>(
                icon: const Icon(Icons.place_outlined),
                elevation: 16,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Vazir',
                  color: Colors.black,
                ),
                items: cities.map<DropdownMenuItem<String>>((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(city),
                    ),
                  );
                }).toList(),
                onChanged: (String? city) {
                  setState(() {
                    defaultCity = city;
                    widget.updateCity(city, widget.hintText);
                  });
                },
                value: defaultCity,
                hint: Text(
                  widget.hintText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Vazir',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
