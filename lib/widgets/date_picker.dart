import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Jalali? picked = await showPersianDatePicker(
          context: context,
          initialDate: Jalali.now(),
          firstDate: Jalali(1390),
          lastDate: Jalali(1450),
        );
        if (picked != null) {
          print('Selected date: $picked');
        }
        Navigator.pop(context);
      },
      child: Container(),
    );
  }
}
