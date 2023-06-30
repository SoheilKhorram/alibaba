import 'package:flutter/material.dart';

import 'package:alibaba/widgets/transactions_screen_app_bar.dart';
import 'package:alibaba/widgets/transactions_card.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransactionsScreenAppBar(),
      body: Column(
        children: const [
          TransactionsCard(),
        ],
      ),
    );
  }
}
