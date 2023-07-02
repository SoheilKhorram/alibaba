import 'package:flutter/material.dart';

import 'package:alibaba/widgets/ticket_tag.dart';
import 'package:alibaba/widgets/ticket_line.dart';
import 'package:alibaba/widgets/airplane_logo.dart';
import 'package:alibaba/widgets/ticket_time.dart';
import 'package:alibaba/widgets/ticket_avalibility.dart';

class Ticket extends StatelessWidget {
  Ticket({
    super.key,
    required this.departureTime,
    required this.arrivalTime,
    required this.tags,
    this.price,
    required this.numberOfRemainingSeats,
  });

  String departureTime;
  String arrivalTime;
  List<String> tags;
  int? price;
  int numberOfRemainingSeats;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;

    if (numberOfRemainingSeats > 0) {
      backgroundColor = Colors.white;
    } else {
      backgroundColor = const Color(0xfff8fafb);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Color.fromARGB(20, 0, 0, 0), blurRadius: 5)
        ],
        color: backgroundColor,
        border: Border.all(
          color: const Color(0x25000000),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        for (int i = 0; i < tags.length; i++) Tag(tags[i]),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        TicketTime(time: arrivalTime),
                        const Line(),
                        TicketTime(time: departureTime),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                const AirplaneLogo()
              ],
            ),
          ),
          const SizedBox(
              height: 1,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0x25000000)),
              )),
          TicketAvalibility(
            price: price,
            numberOfRemainingSeats: numberOfRemainingSeats,
          ),
        ],
      ),
    );
  }
}
