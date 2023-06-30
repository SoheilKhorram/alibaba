import 'package:flutter/material.dart';

import 'package:alibaba/screens/signup_screen.dart';
import 'package:alibaba/screens/login_screen.dart';
import 'package:alibaba/screens/home_screen.dart';
import 'package:alibaba/screens/my_steper_page.dart';
import 'package:alibaba/screens/search_result_screen.dart';
import 'package:alibaba/screens/flight_info_screen.dart';
import 'package:alibaba/screens/info_confirmation_screen.dart';
import 'package:alibaba/screens/account_info_screen.dart';
import 'package:alibaba/screens/transactions_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TransactionsScreen(),
    ),
  );
}
