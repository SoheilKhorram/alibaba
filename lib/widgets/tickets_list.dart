import 'package:flutter/material.dart';

import 'package:alibaba/widgets/ticket.dart';

// ignore: must_be_immutable
class TicketsList extends StatelessWidget {
  TicketsList({
    super.key,
    required this.numberOfAvailableTickets,
    required this.numberOfFullCapacityTickets,
  });

  int numberOfAvailableTickets;
  int numberOfFullCapacityTickets;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: numberOfAvailableTickets,
            itemBuilder: (BuildContext context, int index) {
              return Ticket(isAvailable: true);
            },
          ),
          if (numberOfFullCapacityTickets > 0)
            Container(
              margin: const EdgeInsets.only(top: 32, bottom: 12),
              child: const Text(
                'پروازهای تکمیل ظرفیت',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontFamily: 'Vazir',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: numberOfFullCapacityTickets,
            itemBuilder: (BuildContext context, int index) {
              return Ticket(isAvailable: false);
            },
          )
        ],
      ),
    );
  }
}
