import 'package:alibaba/models/flight_info.dart';
import 'package:alibaba/widgets/ticket_info_item.dart';
import 'package:flutter/material.dart';

class TicketInfo extends StatelessWidget {
  TicketInfo({Key? key}) : super(key: key);

  final FlyInfo flyInfo = FlyInfo(
    departureTime: '10:00',
    arrivalTime: '12:00',
    originCity: 'تهران',
    destinationCity: 'مشهد',
    company: 'ماهان',
    flightNumber: 'W5 123',
    airplaneType: 'A320',
    terminal: 1,
    tag: 'ویژه',
    totalPrice: 2000000,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: "اطلاعات بلیط ",
                      style: TextStyle(
                        fontFamily: 'Vazir',
                        color: Color(0xff4b5259),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  WidgetSpan(
                    child: Icon(
                      Icons.airplane_ticket,
                      size: 20,
                      color: Color(0xff4b5259),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: 6,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff4b5259),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TicketInfoItem(label: 'مبدا', value: flyInfo.originCity),
              TicketInfoItem(label: 'مقصد', value: flyInfo.destinationCity),
              TicketInfoItem(label: 'شرکت هواپیمایی', value: flyInfo.company),
              TicketInfoItem(label: 'ساعت پرواز', value: flyInfo.departureTime),
              TicketInfoItem(label: 'شماره پرواز', value: flyInfo.flightNumber),
            ],
          ),
        )
      ],
    );
  }
}
