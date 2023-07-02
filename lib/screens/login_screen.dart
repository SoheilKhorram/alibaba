import 'dart:io';
import 'package:alibaba/screens/home_screen.dart';
import 'package:alibaba/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:alibaba/widgets/name_input.dart';
import 'package:alibaba/widgets/password_input.dart';
import 'package:alibaba/widgets/submit_button.dart';

String response = '', message = '';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<String> LoginScreen(String userName, String password) async {
    await Socket.connect("10.0.2.2", 4321).then((serverSocket) {
      serverSocket.write('signin/$userName/$password\u0000');
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 52),
              const Text(
                'ورود با کلمه عبور',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Vazir',
                ),
              ),
              const SizedBox(height: 15),
              NameInput(controller: _nameController),
              const SizedBox(height: 15),
              PasswordInput(controller: _passwordController),
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 25),
                  const Text("اکانت ندارید :"),
                  TextButton(
                    child: const Text(
                      'ثبت نام کنید',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
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
                    'ورود در علی‌بابا',
                    onPressed: () async {
                      String name = _nameController.text;
                      String password = _passwordController.text;
                      result = await LoginScreen(
                        name,
                        password,
                      );
                      if (result == '1') {
                        message = 'وارد شدید';
                        // User.name = name;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else if (result == '0') {
                        // ToDo : show error message that user name is duplicate
                        message = 'اطلاعات وارد شده اشتباه است';
                      }
                    },
                  ),
                ),
              ),
              // Spacer(),
              // SubmitButton('ورود به علی‌بابا'),
            ],
          ),
        ),
      ),
    );
  }
}
