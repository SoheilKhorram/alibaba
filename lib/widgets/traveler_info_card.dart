import 'package:alibaba/widgets/ticket_tag.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_name_input.dart';

class TravelerInfoCard extends StatefulWidget {
  const TravelerInfoCard({Key? key}) : super(key: key);

  @override
  _TravelerInfoCardState createState() => _TravelerInfoCardState();
}

class _TravelerInfoCardState extends State<TravelerInfoCard> {
  int selectedGender = 0; // 0 for "National Card", 1 for "PassPort"
  bool isExpanded = false;
  double bottomPadding = 20;

  @override
  Widget build(BuildContext context) {
    if (isExpanded) {
      bottomPadding = 20;
    } else {
      bottomPadding = 0;
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 1.5,
      child: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: bottomPadding,
        ),
        child: Column(
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                title: const Text(
                  'نام و نام خانوادگی',
                  style: TextStyle(fontFamily: 'Vazir', fontSize: 16),
                ),
                subtitle: const Text(
                  'کارت ملی / پاسپورت',
                  style: TextStyle(fontFamily: 'Vazir', fontSize: 12),
                ),
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TicketTag('بزرگسال'),
                    const SizedBox(width: 10),
                    Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                  ],
                ),
              ),
            ),
            if (isExpanded)
              Container(
                height: 1,
                color: Colors.grey[300],
              ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Radio(
                          value: 0,
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                        const Text(
                          "کارت ملی",
                          style: TextStyle(
                            fontFamily: 'Vazir',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Radio(
                          value: 1,
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                        const Text(
                          "پاسپورت",
                          style: TextStyle(
                            fontFamily: 'Vazir',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const CustomNameInput(text: 'نام لاتین'),
                    const SizedBox(height: 15),
                    const CustomNameInput(text: 'نام خانوادگی لاتین'),
                    const SizedBox(height: 15),
                    // for National Card
                    if (selectedGender == 0)
                      Column(
                        children: const [
                          CustomNameInput(text: 'کد ملی'),
                          SizedBox(height: 15),
                          CustomNameInput(text: 'نام'),
                          SizedBox(height: 15),
                          CustomNameInput(text: 'نام خانوادگی'),
                        ],
                      ),
                    //PassPort
                    if (selectedGender == 1)
                      Column(
                        children: const [
                          CustomNameInput(text: 'کشور محل تولد'),
                          SizedBox(height: 15),
                          CustomNameInput(text: 'شماره پاسپورت'),
                        ],
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
