import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() {
    return _PasswordInputState();
  }
}

class _PasswordInputState extends State<PasswordInput> {
  IconData? icon;
  bool? obscureTextState;

  @override
  void initState() {
    super.initState();
    icon = Icons.visibility_off;
    obscureTextState = true;
  }

  void onShowIcon(bool obscureTextState) {
    setState(() {
      this.obscureTextState = !obscureTextState;

      if (obscureTextState) {
        icon = Icons.visibility_off;
      } else {
        icon = Icons.visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            obscureText: obscureTextState!,
            style: const TextStyle(
              fontFamily: 'Vazir',
              fontSize: 16,
            ),
            cursorColor: Colors.black,
            cursorHeight: 24,
            cursorWidth: 1,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  onShowIcon(obscureTextState!);
                },
                icon: Icon(color: Colors.grey, icon),
              ),
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
              labelStyle:
                  const TextStyle(fontFamily: 'Vazir', color: Colors.grey),
              labelText: 'کلمه عبور',
            ),
          ),
        ),
      ),
    );
  }
}
