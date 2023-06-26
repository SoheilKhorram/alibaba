import 'package:alibaba/widgets/travel_date.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class datePicker extends StatefulWidget {
  final Function(Jalali) onDatesSelected;

  const datePicker({Key? key, required this.onDatesSelected})
      : super(key: key);

  @override
  _datePickerState createState() => _datePickerState();
}

class _datePickerState extends State<datePicker> {
  Jalali? raftDate;
  Jalali? bargashtDate;

  void selectRaftDate(BuildContext context) async {
    final Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: raftDate ?? Jalali.now(),
      firstDate: Jalali.now(),
      lastDate: Jalali(1420),
    );
    if (picked != null) {
      setState(() {
        raftDate = picked;
        if (bargashtDate != null && bargashtDate!.isBefore(raftDate!)) {
          bargashtDate = null;
        }
      });
    }
  }

  void selectBargashtDate(BuildContext context) async {
    if (raftDate == null) {
      return;
    }

    final Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: bargashtDate ?? raftDate!.addDays(1),
      firstDate: raftDate!.addDays(1),
      lastDate: Jalali(1420),
    );
    if (picked != null) {
      setState(() {
        bargashtDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            color: const Color(0x05000000),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TravelDate(
                  selectedDate: bargashtDate,
                  hintText: "تاریخ برگشت",
                  onTap: () => selectBargashtDate(context), enabled: raftDate != null,
                ),
              ),
              const SizedBox(
                width: 1,
                height: 48,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              ),
              Expanded(
                child: TravelDate(
                  selectedDate: raftDate,
                  hintText: "تاریخ رفت",
                  onTap: () => selectRaftDate(context), enabled: true,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const SizedBox(height: 15),
      ],
    );
  }
}
