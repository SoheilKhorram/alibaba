import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class TravelDate extends StatelessWidget {
  final Jalali? selectedDate;
  final bool enabled;
  final String hintText;
  final VoidCallback onTap;

  const TravelDate({
    Key? key,
    required this.selectedDate,
    required this.enabled,
    required this.hintText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = selectedDate != null
        ? '${selectedDate!.year}/${selectedDate!.month}/${selectedDate!.day}'.toPersianDigit()
        : hintText;

    return SizedBox(
      height: 48,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            OutlinedButton.icon(
              icon: selectedDate != null ? const SizedBox() : const Icon(
                Icons.calendar_month_outlined,
                color: Colors.grey,
                size: 20,
              ),
              label: Text(
                formattedDate,
                style: TextStyle(
                  color: selectedDate != null ? Colors.black : Colors.grey,
                  fontFamily: 'Vazir',
                  fontSize: 15,
                ),
              ),
              onPressed: enabled ? onTap : null,
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0x00000000),
                side: BorderSide.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
