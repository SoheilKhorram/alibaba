import 'package:flutter/material.dart';

import 'package:alibaba/screens/signup_screen.dart';
import 'package:alibaba/screens/login_screen.dart';
import 'package:alibaba/screens/home_screen.dart';
import 'package:alibaba/screens/search_result_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
