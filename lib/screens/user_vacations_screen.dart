import 'package:flutter/material.dart';

import 'package:alibaba/widgets/user_vacations_app_bar.dart';
import 'package:alibaba/widgets/order_search.dart';

class UserVacationsScreen extends StatelessWidget {
  const UserVacationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserVacationsAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              OrderSearch(),
            ],
          ),
        ),
      ),
    );
  }
}
