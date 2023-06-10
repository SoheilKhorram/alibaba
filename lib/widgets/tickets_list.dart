import 'package:flutter/material.dart';

import 'package:alibaba/widgets/ticket.dart';
import 'package:alibaba/models/ticketmod.dart';

class TicketsList extends StatelessWidget {
  TicketsList({
    Key? key,
    required this.numberOfAvailableTickets,
    required this.numberOfFullCapacityTickets,
  }) : super(key: key);

  int numberOfAvailableTickets;
  int numberOfFullCapacityTickets;

  @override
  Widget build(BuildContext context) {
    List<Ticketmod> availableTickets = [
      Ticketmod(
        price: 1000000,
        tags: const ['اکونومی', 'سیستمی', 'M37'],
        departureTime: '12:00',
        arrivalTime: '21:40',
        numberOfRemainingSeats: 10,
      ),
    ];

    List<Ticketmod> fullCapacityTickets = [
      Ticketmod(
        tags: const ['اکونومی', 'سیستمی', 'M37'],
        departureTime: '12:00',
        arrivalTime: '14:00',
        numberOfRemainingSeats: 0,
      ),
      Ticketmod(
        tags: const ['اکونومی', 'سیستمی', 'M37'],
        departureTime: '23:30',
        arrivalTime: '34:00',
        numberOfRemainingSeats: 0,
      ),
    ];

    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: availableTickets.length,
            itemBuilder: (BuildContext context, int index) {
              Ticketmod ticket = availableTickets[index];

              return Ticket(
                price: ticket.price,
                tags: ticket.tags,
                departureTime: ticket.departureTime,
                arrivalTime: ticket.arrivalTime,
                numberOfRemainingSeats: ticket.numberOfRemainingSeats,
              );
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
            itemCount: fullCapacityTickets.length,
            itemBuilder: (BuildContext context, int index) {
              Ticketmod ticket = fullCapacityTickets[index];
              return Ticket(
                tags: ticket.tags,
                departureTime: ticket.departureTime,
                arrivalTime: ticket.arrivalTime,
                numberOfRemainingSeats: ticket.numberOfRemainingSeats,
              );
            },
          )
        ],
      ),
    );
  }
}
