import 'package:flutter/material.dart';

import 'package:alibaba/widgets/name_input.dart';
import 'package:alibaba/widgets/password_input.dart';
import 'package:alibaba/widgets/email_input.dart';
import 'package:alibaba/widgets/submit_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: const [
            SizedBox(height: 52),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Text(
                'ورود با کلمه عبور',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Vazir',
                ),
              ),
            ),
            NameInput(),
            PasswordInput(),
            EmailInput(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SubmitButton('ورود به علی‌بابا'),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}