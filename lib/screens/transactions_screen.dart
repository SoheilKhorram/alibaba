import 'package:flutter/material.dart';

import 'package:alibaba/widgets/transactions_screen_app_bar.dart';
import 'package:alibaba/widgets/transactions_card.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransactionsScreenAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 16),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              itemCount: 10,
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return const TransactionsCard(
                  date: '1400/01/01',
                  price: 1000000,
                  digitalReceipt: 'https://www.google.com/',
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
