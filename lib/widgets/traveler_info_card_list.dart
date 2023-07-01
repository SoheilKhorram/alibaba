import 'package:flutter/material.dart';

import 'package:alibaba/widgets/traveler_info_card.dart';

class TravelerInfoCardList extends StatefulWidget {
  const TravelerInfoCardList({Key? key}) : super(key: key);

  @override
  _TravelerInfoCardListState createState() => _TravelerInfoCardListState();
}

class _TravelerInfoCardListState extends State<TravelerInfoCardList> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                    text: "مشخصات مسافران ",
                    style: TextStyle(
                      fontFamily: 'Vazir',
                      color: Color(0xff4b5259),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                WidgetSpan(
                  child: Icon(
                    Icons.airline_seat_recline_extra_rounded,
                    size: 20,
                    color: Color(0xff4b5259),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
            shrinkWrap: true,
            itemCount: itemCount,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return const TravelerInfoCard(isDeletable: false);
              }
              return const TravelerInfoCard();
            }),
        Align(
          alignment: Alignment.centerRight,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  itemCount++;
                });
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF0077db)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: Color(0xFF0077db),
                    ),
                  ),
                ),
              ),
              icon: const Icon(Icons.add),
              label: const Text(
                'اضافه کردن مسافر جدید',
                style: TextStyle(fontFamily: 'Vazir'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
