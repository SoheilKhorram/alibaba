import 'package:flutter/material.dart';

import 'package:alibaba/widgets/transactions_screen_app_bar.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TransactionsScreenAppBar(),
      body: Center(
        child: Text("Transactions Screen"),
      ),
    );
  }
}
