import 'package:flutter/material.dart';

import 'package:alibaba/widgets/ticket_tag.dart';
import 'package:alibaba/widgets/ticket_line.dart';
import 'package:alibaba/widgets/airplane_logo.dart';
import 'package:alibaba/widgets/ticket_time.dart';
import 'package:alibaba/widgets/ticket_avalibility.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Color.fromARGB(20, 0, 0, 0), blurRadius: 5)
        ],
        color: Colors.white,
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
                      children: [Tag('سیستمی'), Tag('اکونومی'), Tag('M37')],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        TicketTime(time: '22:30'),
                        Line(),
                        TicketTime(time: '22:30'),
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
          TicketAvalibility(price: '1200000', numberOfRemainingSeats: '7'),
        ],
      ),
    );
  }
}
