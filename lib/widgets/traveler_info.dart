import 'package:flutter/material.dart';

import 'package:alibaba/models/traveler_info_model.dart';
import 'package:alibaba/widgets/info_item.dart';

class TravelerInfo extends StatelessWidget {
  TravelerInfo({Key? key}) : super(key: key);

  final TravelerInfoModel travelerInfo = TravelerInfoModel(
    firstName: 'سهیل',
    lastName: 'خرم',
    nationalCode: 1234567890,
    birthDate: '1370/01/01',
    gender: 'مرد',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
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
                        Icons.people_rounded,
                        size: 20,
                        color: Color(0xff4b5259),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 6,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff4b5259),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                InfoItem(
                    label: 'نام و نام خانوادگی', value: travelerInfo.fullName),
                InfoItem(label: 'جنسیت', value: travelerInfo.gender),
                InfoItem(
                    label: 'کد ملی / شماره پاسپورت',
                    value: travelerInfo.nationalCode.toString() +
                        travelerInfo.passportNumber.toString()),
                InfoItem(label: 'ساعت پرواز', value: travelerInfo.birthDate),
              ],
            ),
          )
        ],
      ),
    );
  }
}
