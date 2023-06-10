import 'package:flutter/material.dart';

import 'package:alibaba/widgets/ticket_app_bar.dart';
import 'package:alibaba/widgets/price_date_list.dart';
import 'package:alibaba/widgets/sorting_drop_down.dart';
import 'package:alibaba/widgets/filter_button.dart';
import 'package:alibaba/widgets/tickets_list.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() {
    return _SearchResultScreenState();
  }
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TicketAppBar(),
      body: Column(
        children: [
          const PriceDateList(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                SortingDropDown(),
                SizedBox(width: 16),
                FilterButton(),
              ],
            ),
          ),
          TicketsList(
            numberOfAvailableTickets: 5,
            numberOfFullCapacityTickets: 3,
          )
        ],
      ),
    );
  }
}
