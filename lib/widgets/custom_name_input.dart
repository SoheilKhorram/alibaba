import 'package:flutter/material.dart';

class CustomNameInput extends StatelessWidget {
  const CustomNameInput({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          style: const TextStyle(
            fontFamily: 'Vazir',
            fontSize: 16,
          ),
          cursorColor: Colors.black,
          cursorHeight: 24,
          cursorWidth: 1,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xFFFDB713),
                width: 2.5,
              ),
            ),
            labelStyle: const TextStyle(fontFamily: 'Vazir', color: Colors.grey),
            labelText: text,
          ),
        ),
      ),
    );
  }
}
