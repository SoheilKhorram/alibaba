import 'package:flutter/material.dart';

import 'package:alibaba/widgets/transactions_screen_app_bar.dart';
import 'package:alibaba/widgets/transactions_card.dart';
import 'package:alibaba/models/transaction_model.dart';

// ignore: must_be_immutable
class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({super.key});

  List<TransactionModel> transactions = [
    TransactionModel(
      date: '1400/01/34',
      price: 1000000,
      digitalReceipt: 'https://www.google.com/',
    ),
    TransactionModel(
      date: '1400/01/11',
      price: 1000000,
      digitalReceipt: 'https://www.google.com/',
    ),
    TransactionModel(
      date: '1403/01/01',
      price: 1000000,
      digitalReceipt: 'https://www.google.com/',
    ),
    TransactionModel(
      date: '1404/01/01',
      price: 1000000,
      digitalReceipt: 'https://www.google.com/',
    ),
    TransactionModel(
      date: '1400/01/01',
      price: 1000000,
      digitalReceipt: 'https://www.google.com/',
    ),
    TransactionModel(
      date: '1400/01/01',
      price: 1000000,
      digitalReceipt: 'https://www.google.com/',
    ),
    TransactionModel(
      date: '1400/01/01',
      price: 1000000,
      digitalReceipt: 'https://www.google.com/',
    ),
    TransactionModel(
      date: '1400/01/01',
      price: 1000000,
      digitalReceipt: 'https://www.google.com/',
    ),
  ];

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
              itemCount: transactions.length,
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return TransactionsCard(
                  date: transactions[index].date,
                  price: transactions[index].price,
                  digitalReceipt: transactions[index].digitalReceipt,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
