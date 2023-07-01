import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  const NameInput({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          style: const TextStyle(
            fontFamily: 'Vazir',
            fontSize: 16,
          ),
          cursorColor: Colors.black,
          cursorHeight: 24,
          cursorWidth: 1,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xFFFDB713),
                width: 2.5,
              ),
            ),
            labelStyle: TextStyle(fontFamily: 'Vazir', color: Colors.grey),
            labelText: 'نام کاربری',
          ),
        ),
      ),
    );
  }
}
