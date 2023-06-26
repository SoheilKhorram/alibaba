import 'package:alibaba/widgets/account_info_app_bar.dart';
import 'package:flutter/material.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AccountInfoScreenState();
  }
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AccountInfoAppBar(),
    );
  }
}
