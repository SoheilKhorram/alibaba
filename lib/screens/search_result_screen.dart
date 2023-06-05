import 'package:flutter/material.dart';

import 'package:alibaba/widgets/ticket_app_bar.dart';
import 'package:alibaba/widgets/price_date_list.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() {
    return _SearchResultScreenState();
  }
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TicketAppBar(),
      body: Column(
        children: const [
          PriceDateList(),
        ],
      ),
    );
  }
}
