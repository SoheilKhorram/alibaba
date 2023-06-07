import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';


class TravelDate extends StatefulWidget {
  final String text;

  const TravelDate({Key? key, required this.text}) : super(key: key);

  @override
  _TravelDateState createState() => _TravelDateState();
}

class _TravelDateState extends State<TravelDate> {
  Jalali? _selectedDate;

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
            _selectedDate != null ? _selectedDate!.formatFullDate() : widget.text,
            style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'Vazir',
              fontSize: 15,
            ),
          ),
          onPressed: () async {
            final Jalali? picked = await showPersianDatePicker(
              context: context,
              initialDate: Jalali.now(),
              firstDate: Jalali(Jalali.now().year,Jalali.now().month,Jalali.now().day),
              lastDate: Jalali(1420),
            );

            if (picked != null) {
              setState(() {
                _selectedDate = picked;
              });
            }
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
