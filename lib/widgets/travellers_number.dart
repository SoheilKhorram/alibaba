import 'package:alibaba/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:persian_number_utility/persian_number_utility.dart';

// ignore: must_be_immutable
class TravellersNumber extends StatefulWidget {
  TravellersNumber({
    super.key,
    required this.numberOfGrownups,
    required this.numberOfKids,
    required this.numberOfinfants,
    required this.numberOfTravelers,
    required this.updateNumberOfGrownups,
    required this.updateNumberOfKids,
    required this.updateNumberOfinfants,
    required this.updateNumberOfTravelers,
  });

  int numberOfGrownups;
  int numberOfKids;
  int numberOfinfants;
  int numberOfTravelers;

  Function(int) updateNumberOfGrownups;
  Function(int) updateNumberOfKids;
  Function(int) updateNumberOfinfants;
  Function(int) updateNumberOfTravelers;

  @override
  State<TravellersNumber> createState() {
    return _TravellersNumberState();
  }
}

class _TravellersNumberState extends State<TravellersNumber> {
  void incrementGrownups(int numberOfGrownups) {
    setState(() {
      widget.numberOfGrownups = numberOfGrownups + 1;
      widget.numberOfTravelers = widget.numberOfGrownups +
          widget.numberOfKids +
          widget.numberOfinfants;
      widget.updateNumberOfGrownups(widget.numberOfGrownups);
      widget.updateNumberOfTravelers(widget.numberOfTravelers);
    });
  }

  void decrementGrownups(int numberOfGrownups) {
    setState(() {
      widget.numberOfGrownups = numberOfGrownups - 1;
      widget.numberOfTravelers = widget.numberOfGrownups +
          widget.numberOfKids +
          widget.numberOfinfants;
      widget.updateNumberOfGrownups(widget.numberOfGrownups);
      widget.updateNumberOfTravelers(widget.numberOfTravelers);
    });
  }

  void incrementKids(int numberOfKids) {
    setState(() {
      widget.numberOfKids = numberOfKids + 1;
      widget.numberOfTravelers = widget.numberOfGrownups +
          widget.numberOfKids +
          widget.numberOfinfants;
      widget.updateNumberOfKids(widget.numberOfKids);
      widget.updateNumberOfTravelers(widget.numberOfTravelers);
    });
  }

  void decrementKids(int numberOfKids) {
    setState(() {
      widget.numberOfKids = numberOfKids - 1;
      widget.numberOfTravelers = widget.numberOfGrownups +
          widget.numberOfKids +
          widget.numberOfinfants;
      widget.updateNumberOfKids(widget.numberOfKids);
      widget.updateNumberOfTravelers(widget.numberOfTravelers);
    });
  }

  void incrementInfants(int numberOfinfants) {
    setState(() {
      widget.numberOfinfants = numberOfinfants + 1;
      widget.numberOfTravelers = widget.numberOfGrownups +
          widget.numberOfKids +
          widget.numberOfinfants;
      widget.updateNumberOfinfants(widget.numberOfinfants);
      widget.updateNumberOfTravelers(widget.numberOfTravelers);
    });
  }

  void decrementInfants(int numberOfinfants) {
    setState(() {
      widget.numberOfinfants = numberOfinfants - 1;
      widget.numberOfTravelers = widget.numberOfGrownups +
          widget.numberOfKids +
          widget.numberOfinfants;
      widget.updateNumberOfinfants(widget.numberOfinfants);
      widget.updateNumberOfTravelers(widget.numberOfTravelers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'مسافران',
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  const Text(
                    'بزرگسال  (12 سال به بالا)',
                    style: TextStyle(
                      fontFamily: 'Vazir',
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      incrementGrownups(widget.numberOfGrownups);
                    },
                    icon: const Icon(
                      Icons.add_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                  Text(
                    "${widget.numberOfGrownups}".toPersianDigit(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Vazir',
                    ),
                    locale: const Locale('fa'),
                  ),
                  IconButton(
                    onPressed: widget.numberOfGrownups <= 1
                        ? null
                        : () {
                            decrementGrownups(widget.numberOfGrownups);
                          },
                    icon: const Icon(
                      Icons.indeterminate_check_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'کودک (2 تا 12 سال)',
                    style: TextStyle(
                      fontFamily: 'Vazir',
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      incrementKids(widget.numberOfKids);
                    },
                    icon: const Icon(
                      Icons.add_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                  Text(
                    "${widget.numberOfKids}".toPersianDigit(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Vazir',
                    ),
                    locale: const Locale('fa'),
                  ),
                  IconButton(
                    onPressed: widget.numberOfKids <= 0
                        ? null
                        : () {
                            decrementKids(widget.numberOfKids);
                          },
                    icon: const Icon(
                      Icons.indeterminate_check_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'نوزاد (10 روز تا 2 سال)',
                    style: TextStyle(
                      fontFamily: 'Vazir',
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      incrementInfants(widget.numberOfinfants);
                    },
                    icon: const Icon(
                      Icons.add_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                  Text(
                    "${widget.numberOfinfants}".toPersianDigit(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Vazir',
                    ),
                    locale: const Locale('fa'),
                  ),
                  IconButton(
                    onPressed: widget.numberOfinfants <= 0
                        ? null
                        : () {
                            decrementInfants(widget.numberOfinfants);
                          },
                    icon: const Icon(
                      Icons.indeterminate_check_box,
                      size: 35,
                    ),
                    color: const Color(0xFF0077db),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0077db),
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "تایید و جستجو",
                      style: TextStyle(
                        fontFamily: 'Vazir',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
