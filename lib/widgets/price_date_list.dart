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
  final int itemCount = 10;
  final double itemWidth = 80.0;

  late ScrollController _scrollController;
  int currentIndex = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  void navigateToPrevious() {
    setState(() {
      currentIndex = currentIndex > 0 ? currentIndex - 1 : 0;
      _scrollController.animateTo(currentIndex * itemWidth, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  void navigateToNext() {
    setState(() {
      currentIndex = currentIndex < itemCount - 1 ? currentIndex + 1 : itemCount - 1;
      _scrollController.animateTo(currentIndex * itemWidth, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

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
              onPressed: navigateToPrevious,
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
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Container(
                  width: itemWidth,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: currentIndex == index ? Colors.blue : Colors.black26,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
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
              onPressed: navigateToNext,
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
