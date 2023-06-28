import 'package:alibaba/widgets/custom_name_input.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class datePicker extends StatefulWidget {
  final Function(Jalali) onDatesSelected;

  const datePicker({Key? key,  required this.onDatesSelected, Jalali? fromDate, Jalali? toDate,  void Function()? selectFromDate,  void Function()? selectToDate})
      : super(key: key);

  @override
  _datePickerState createState() => _datePickerState();
}

class _datePickerState extends State<datePicker> {
  Jalali? fromDate;
  Jalali? toDate;

  void selectFromDate(BuildContext context) async {
    final Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: fromDate ?? Jalali.now(),
      firstDate: Jalali.now(),
      lastDate: Jalali(1420),
    );
    if (picked != null) {
      setState(() {
        fromDate = picked;
        if (toDate != null && toDate!.isBefore(fromDate!.addDays(1))) {
          toDate = null;
        }
      });
      widget.onDatesSelected(fromDate!);
    }
  }

  void selectToDate(BuildContext context) async {
    if (fromDate == null) {
      return;
    }

    final Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: toDate ?? fromDate!.addDays(1),
      firstDate: fromDate!.addDays(1),
      lastDate: Jalali(1420),
    );
    if (picked != null) {
      setState(() {
        toDate = picked;
      });
      widget.onDatesSelected(toDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: CustomNameInput(
                selectedDate: toDate,
                onTap: () => selectToDate(context),
                enabled: true, text: 'تا',
              ),
            ),
            Flexible(
              child: CustomNameInput(
                selectedDate: fromDate,
                onTap: () => selectFromDate(context),
                enabled: true, text: 'از',

              ),
            ),
          ],
        ),
      ],
    );
  }
}