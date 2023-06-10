import 'package:flutter/material.dart';

import 'package:alibaba/widgets/prices.dart';
import 'package:alibaba/widgets/dates.dart';

class PriceDateList extends StatefulWidget {
  const PriceDateList({Key? key}) : super(key: key);

  @override
  State<PriceDateList> createState() {
    return _PriceDateListState();
  }
}

class _PriceDateListState extends State<PriceDateList> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    children: const [
                      Dates(date: "ج - 28/04"),
                      Prices(price: 1238),
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
    );
  }
}
