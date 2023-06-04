import 'package:flutter/material.dart';

import 'package:alibaba/widgets/ticket_app_bar.dart';

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
    return const Scaffold(
      appBar: TicketAppBar(),
    );
  }
}
