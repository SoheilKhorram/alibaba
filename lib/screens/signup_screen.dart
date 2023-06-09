import 'package:flutter/material.dart';

import 'package:alibaba/widgets/name_input.dart';
import 'package:alibaba/widgets/password_input.dart';
import 'package:alibaba/widgets/email_input.dart';
import 'package:alibaba/widgets/submit_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 52),
              Text(
                'ثبت نام',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Vazir',
                ),
              ),
              NameInput(),
              SizedBox(height: 15),
              PasswordInput(),
              SizedBox(height: 15),
              EmailInput(),
              Spacer(),
              SubmitButton('ثبت نام در علی‌بابا'),
            ],
          ),
        ),
      ),
    );
  }
}
