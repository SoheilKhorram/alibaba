import 'package:flutter/material.dart'; 
 
import 'package:alibaba/widgets/name_input.dart'; 
import 'package:alibaba/widgets/password_input.dart'; 
import 'package:alibaba/widgets/email_input.dart'; 
import 'package:alibaba/widgets/submit_button.dart'; 
 
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
              Expanded( 
                child: Align( 
                  alignment: Alignment.bottomCenter, 
                  child: SubmitButton( 
                    'ثبت نام در علی‌بابا', 
                    onPressed: () { 
                      String name = _nameController.text; 
                      String password = _passwordController.text; 
                      String email = _emailController.text; 
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