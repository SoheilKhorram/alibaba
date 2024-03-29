import 'package:flutter/material.dart';

import 'package:alibaba/widgets/ticket.dart';
import 'package:alibaba/models/ticketmod.dart';

class TicketsList extends StatelessWidget {
  const TicketsList({
    Key? key,
    required this.numberOfAvailableTickets,
    required this.numberOfFullCapacityTickets,
    required this.sortType,
  }) : super(key: key);

  final int numberOfAvailableTickets;
  final int numberOfFullCapacityTickets;
  final String? sortType;

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
      Ticketmod(
        price: 1200000,
        tags: const ['بیزینس', 'سیستمی', 'A14'],
        departureTime: '09:30',
        arrivalTime: '18:15',
        numberOfRemainingSeats: 5,
      ),
      Ticketmod(
        price: 800000,
        tags: const ['اکونومی', 'چارتر', 'L22'],
        departureTime: '15:45',
        arrivalTime: '23:55',
        numberOfRemainingSeats: 15,
      ),

      Ticketmod(
        price: 2500000,
        tags: const ['فرست کلاس', 'چارتر', 'MD8'],
        departureTime: '17:00',
        arrivalTime: '00:00',
        numberOfRemainingSeats: 30,
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
        departureTime: '14:00',
        arrivalTime: '23:30',
        numberOfRemainingSeats: 0,
      ),
      Ticketmod(
        tags: const ['بیزینس', 'سیستمی', 'A14'],
        departureTime: '08:15',
        arrivalTime: '11:40',
        numberOfRemainingSeats: 0,
      ),

    ];
    //this logic depends on input data and it can be changed in the future while using socket
    switch (sortType) {
      case 'زودترین':
        availableTickets.sort((a, b) => a.departureTime.compareTo(b.departureTime));
        break;
      case 'دیرترین':
        availableTickets.sort((a, b) => b.departureTime.compareTo(a.departureTime));
        break;
      case 'ارزانترین':
        availableTickets.sort((a, b) => a.price!.compareTo(b.price as num));
        break;
      case 'گرانترین':
        availableTickets.sort((a, b) => b.price!.compareTo(a.price as num));
        break;
    }

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
