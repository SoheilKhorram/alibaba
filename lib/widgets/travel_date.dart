import 'package:flutter/material.dart';
import 'package:alibaba/widgets/date_picker.dart';
import 'packa';
// ignore: must_be_immutable
class TravelDate extends StatefulWidget {
  TravelDate({super.key, required this.text});

  String text;

  @override
  State<TravelDate> createState() {
    return _TravelDateState();
  }
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
          onPressed: () { const date_picker();},
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0x05000000),
            side: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
