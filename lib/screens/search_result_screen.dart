import 'package:flutter/material.dart';

import 'package:alibaba/widgets/ticket_app_bar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

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
      appBar: const TicketAppBar(),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 5),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 64,
                  color: const Color(0x05000000),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  height: 64,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 80.0,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.black26,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "ج - 28/04".toPersianDigit(),
                              style: const TextStyle(
                                fontSize: 13,
                                fontFamily: 'Vazir',
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              '1325'.seRagham().toPersianDigit(),
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Vazir',
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: 30,
                  height: 64,
                  color: const Color(0x05000000),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
