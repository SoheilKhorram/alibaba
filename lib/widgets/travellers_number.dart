import 'package:flutter/material.dart';

class TravellersNumber extends StatefulWidget {
  const TravellersNumber({super.key});

  @override
  State<TravellersNumber> createState() {
    return _TravellersNumberState();
  }
}

class _TravellersNumberState extends State<TravellersNumber> {
  int? numberOfGrownups;
  int? numberOfKids;
  int? numberOfinfants;

  @override
  void initState() {
    super.initState();
    print(numberOfGrownups);
    numberOfGrownups = 1;
    print(numberOfGrownups);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: Text('مسافران'),
              ),
              Row(
                children: [
                  const Text('بزرگسال (12 سال به بالا)'),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                  Text("$numberOfGrownups"),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.indeterminate_check_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
