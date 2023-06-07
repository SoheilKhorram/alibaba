import 'package:flutter/material.dart';

import 'date_picker.dart';

class TravelDate extends StatefulWidget {
  final String text;

  const TravelDate({Key? key, required this.text}) : super(key: key);

  @override
  _TravelDateState createState() => _TravelDateState();
}

class _TravelDateState extends State<TravelDate> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DatePickerScreen(),
              ),
            );
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0x05000000),
            side: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

