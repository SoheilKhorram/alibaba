import 'package:flutter/material.dart';

import 'package:alibaba/widgets/travel_info_text.dart';
import 'package:alibaba/widgets/travel_info_date.dart';

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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
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
      ),
    );
  }
}
