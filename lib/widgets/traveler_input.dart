import 'package:flutter/material.dart';

import 'package:alibaba/widgets/travellers_number.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class TravelerInput extends StatefulWidget {
  const TravelerInput({Key? key}) : super(key: key);

  @override
  State<TravelerInput> createState() {
    return _TravelerInputState();
  }
}

class _TravelerInputState extends State<TravelerInput> {
  late int numberOfGrownups;
  late int numberOfKids;
  late int numberOfinfants;
  late int numberOfTravelers;

  @override
  void initState() {
    super.initState();
    numberOfGrownups = 1;
    numberOfKids = 0;
    numberOfinfants = 0;
    numberOfTravelers = 1;
  }

  void updateNumberOfTravelers(int numberOfTravelers) {
    setState(() {
      this.numberOfTravelers = numberOfTravelers;
    });
  }

  void updateNumberOfGrownups(int numberOfGrownups) {
    setState(() {
      this.numberOfGrownups = numberOfGrownups;
    });
  }

  void updateNumberOfKids(int numberOfKids) {
    setState(() {
      this.numberOfKids = numberOfKids;
    });
  }

  void updateNumberOfinfants(int numberOfinfants) {
    setState(() {
      this.numberOfinfants = numberOfinfants;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0x05000000),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          hintText: '$numberOfTravelers مسافر'.toPersianDigit(),
          labelText: "مسافران",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: const TextStyle(
            fontFamily: 'Vazir',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          labelStyle: const TextStyle(
            fontFamily: 'Vazir',
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        onTap: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            context: context,
            builder: (BuildContext context) {
              return TravellersNumber(
                numberOfGrownups: numberOfGrownups,
                numberOfKids: numberOfKids,
                numberOfinfants: numberOfinfants,
                numberOfTravelers: numberOfTravelers,
                updateNumberOfTravelers: updateNumberOfTravelers,
                updateNumberOfGrownups: updateNumberOfGrownups,
                updateNumberOfKids: updateNumberOfKids,
                updateNumberOfinfants: updateNumberOfinfants,
              );
            },
          );
        },
      ),
    );
  }
}
