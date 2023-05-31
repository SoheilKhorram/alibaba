//import necessary package

import 'package:flutter/material.dart';
import 'dart:async';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key});

  @override
  State<PasswordInput> createState() {
    return _PasswordInputState();
  }
}

class _PasswordInputState extends State<PasswordInput> {
  IconData? icon;
  bool? obscureTextState;
  late bool showPassword;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    icon = Icons.visibility_off;
    obscureTextState = true;
    showPassword = false;
  }

  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;

      if (showPassword) {
        icon = Icons.visibility;
        _timer = Timer(const Duration(seconds: 3), () {
          setState(() {
            showPassword = false;
            icon = Icons.visibility_off;
          });
        });
      } else {
        icon = Icons.visibility_off;
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            obscureText: !showPassword,
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
                onPressed: togglePasswordVisibility,
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
