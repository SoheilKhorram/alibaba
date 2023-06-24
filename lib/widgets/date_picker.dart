import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

Future<void> selectDate(BuildContext context, Jalali? selectedDate, Function(Jalali) onDateSelected) async {
  final Jalali? picked = await showPersianDatePicker(
    context: context,
    initialDate: selectedDate ?? Jalali.now(),
    firstDate: Jalali(
      Jalali.now().year,
      Jalali.now().month,
      Jalali.now().day,
    ),
    lastDate: Jalali(1420),
  );
  if (picked != null) {
    onDateSelected(picked);
  }
}
