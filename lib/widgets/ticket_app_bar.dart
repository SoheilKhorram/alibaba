import 'package:flutter/material.dart';

import 'package:alibaba/widgets/travel_info_text.dart';
import 'package:alibaba/widgets/travel_info_date.dart';

class TicketAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TicketAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 150,
      elevation: 4,
      shadowColor: Colors.black26,
      backgroundColor: Colors.white,
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TravelInfoText(
              transportationVehicle: "هواپیما",
              originCity: "تهران",
              destinationCity: "مشهد",
            ),
            TravelInfoDate(date: "چهارشنبه ۲۵ اسفند")
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward, color: Colors.black54),
        ),
      ],
      leading: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CircleAvatar(
          backgroundColor: const Color(0xFFFDB713),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ),
      ),
      leadingWidth: 75,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
