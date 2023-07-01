import 'dart:io';

import 'package:flutter/material.dart';

import 'package:alibaba/widgets/name_input.dart';
import 'package:alibaba/widgets/password_input.dart';
import 'package:alibaba/widgets/email_input.dart';
import 'package:alibaba/widgets/submit_button.dart';
import '../widgets/User.dart';
import '../widgets/date_picker.dart';
import 'login_screen.dart';

String response = "", message = "";

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<String> SignupScreen(String userName, String password) async {
    await Socket.connect("10.0.2.2", 4321).then((serverSocket) {
      serverSocket.write('SignUp/$userName/$password\u0000');
      serverSocket.flush();
      serverSocket.listen((socket) {
        setState(() {
          response = String.fromCharCodes(socket);
        });
      });
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 52),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Text(
                  'ثبت نام',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Vazir',
                  ),
                ),
              ),
              NameInput(controller: _nameController),
              const SizedBox(height: 16),
              PasswordInput(controller: _passwordController),
              const SizedBox(height: 16),
              EmailInput(controller: _emailController),
              Row(
                children: [
                  const SizedBox(width: 25),
                  const Text("اکانت دارید :"),
                  TextButton(
                    child: const Text(
                      'وارد شوید ',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                  Text(message),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SubmitButton(
                    'ثبت نام در علی‌بابا',
                    onPressed: () async {
                      String name = _nameController.text;
                      String password = _passwordController.text;
                      String email = _emailController.text;
                      String result = await SignupScreen(
                        name,
                        password,
                      );
                      print('this is result: $result');
                      if (result == '1') {
                        message = 'اکانت شما با موفقیت ساخته شد';
                        User.name = name;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else {
                        // ToDo : show error message that user name is duplicate
                        message = 'نام کاربری تکراری است';
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
