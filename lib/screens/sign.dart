// import 'package:provider/provider.dart';
import 'package:alibaba/screens/home_screen.dart';
import 'package:alibaba/screens/login_screen.dart';
import 'package:flutter/material.dart';
// import 'package:reddit/user.dart';
// import 'siginpage.dart';
// import 'ToHome.dart';
// import 'main.dart';
import 'dart:io';

// validate that password contains 8 chars and  at least one number and  a small and a capital character
isValidPassword(String pass) {
  if (pass.length >= 8) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    return RegExp(pattern).hasMatch(pass);
  }
  return false;
}

isValidUserName(String userName) {
  if (userName.isNotEmpty) {
    return true;
  }
  return false;
}

class TSignUp extends StatefulWidget {
  const TSignUp({Key? key}) : super(key: key);
  @override
  State<TSignUp> createState() => TSignUpState();
}

class TSignUpState extends State<TSignUp> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  bool obscure = true, userNameChecker = false, passwordChecker = false;
  String? userNameErrorMessage, passwordErrorMessage;
  String showMessage = '', response = '';

  // disabling button when password is not valid and username and pass and email are not empty and email is correct
  @override
  void initState() {
    super.initState();
    userName.addListener(() {
      setState(() {
        if (isValidUserName(userName.text)) {
          userNameChecker = true;
        } else {
          userNameChecker = false;
        }
      });
    });
    password.addListener(() {
      setState(() {
        if (isValidPassword(password.text)) {
          passwordChecker = true;
        } else {
          passwordChecker = false;
        }
      });
    });
  }

  // deleting the text controller when widget is disposed (finalize method)
  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  Future<String> TSignUp() async {
    await Socket.connect("10.0.2.2", 4321).then((serverSocket) {
      serverSocket.write('SignUp/${userName.text}/${password.text}\u0000');
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
    return Material(
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: SafeArea(
            child: Center(
              child: Wrap(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(238, 248, 248, 248),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    width: 370,
                    height: 450,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 18,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            controller: userName,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            onChanged: (text) {
                              userNameErrorMessage =
                                  isValidUserName(userName.text)
                                      ? null
                                      : 'نام کاربری تکراری است';
                            },
                            decoration: InputDecoration(
                              filled: true,
                              errorText: userNameErrorMessage,
                              labelText: 'نام کاربری: ',
                              labelStyle: const TextStyle(color: Colors.yellow),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide:
                                    const BorderSide(color: Color(0xfffdfdfd)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide:
                                    const BorderSide(color: Color(0xfffc4040)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            controller: password,
                            obscureText: obscure,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            onChanged: (text) {
                              passwordErrorMessage =
                                  isValidPassword(password.text)
                                      ? null
                                      : 'پسورد ضعیف است';
                            },
                            decoration: InputDecoration(
                              filled: true,
                              errorText: passwordErrorMessage,
                              labelText: 'پسورد: ',
                              suffixIcon: IconButton(
                                icon: Icon(obscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    obscure = !obscure;
                                  });
                                },
                              ),
                              labelStyle:
                                  const TextStyle(color: Colors.redAccent),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide:
                                    const BorderSide(color: Color(0xfffdfdfd)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide:
                                    const BorderSide(color: Color(0xfffc4040)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const SizedBox(width: 25),
                            const Text("وارد شوید : "),
                            TextButton(
                              child: const Text(
                                'لاگین',
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
                          ],
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: userNameChecker && passwordChecker
                              ? () async {
                                  String result = await TSignUp();
                                  print('this is result: $result');
                                  if (result == '1') {
                                    // User.name = userName.text ;
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ),
                                    );
                                  } else {
                                    // ToDo : show error message that user name is duplicate
                                    showMessage = 'نام کاربری تکراری است';
                                  }
                                }
                              : null,
                          child: const Text(
                            'ثبت نام',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            primary: Color.fromARGB(255, 224, 224, 47),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 10,
                            ),
                          ),
                        ),
                        Text(
                          showMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
