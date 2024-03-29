import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CustomNameInput extends StatelessWidget {
  const CustomNameInput({
    required this.text,
    Key? key,
    this.onTap,
    this.selectedDate,
    this.enabled,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  final String text;
  final void Function()? onTap;
  final Jalali? selectedDate;
  final bool? enabled;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    String formattedDate = selectedDate != null
        ? '${selectedDate!.year}/${selectedDate!.month}/${selectedDate!.day}'.toPersianDigit()
        : text;
    return SizedBox(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          style: const TextStyle(
            fontFamily: 'Vazir',
            fontSize: 16,
          ),
          onTap: onTap,
          cursorColor: Colors.black,
          cursorHeight: 24,
          cursorWidth: 1,
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xff000000),
                width: 1,
              ),
            ),
            labelStyle:
            const TextStyle(fontFamily: 'Vazir', color: Colors.grey),
            labelText: text,
          ),
          controller: controller ?? TextEditingController(
            text: selectedDate != null ? formattedDate : '',
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
