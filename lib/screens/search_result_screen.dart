import 'package:flutter/material.dart';

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
            children: const [
              Text(
                "بلیط هواپیما مبدا به مقصد",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Vazir',
                  color: Colors.black,
                ),
              ),
              Text(
                "۱۳۹۹/۰۵/۱۵",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Vazir',
                  color: Colors.black45,
                ),
              ),
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
