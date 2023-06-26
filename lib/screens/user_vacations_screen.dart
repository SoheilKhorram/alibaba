import 'package:flutter/material.dart';

import 'package:alibaba/widgets/user_vacations_app_bar.dart';

class UserVacationsScreen extends StatelessWidget {
  const UserVacationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: UserVacationsAppBar(),
      body: Center(
        child: Text('UserVacationsScreen'),
      ),
    );
  }
}
