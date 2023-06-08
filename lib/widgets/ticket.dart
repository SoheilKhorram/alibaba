import 'package:flutter/material.dart';

import 'package:alibaba/widgets/tag.dart';
import 'package:alibaba/widgets/ticket_line.dart';
import 'package:alibaba/widgets/airplane_logo.dart';
import 'package:alibaba/widgets/ticket_time.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
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
    );
  }
}
