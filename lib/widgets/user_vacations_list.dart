import 'package:flutter/material.dart';

import 'package:alibaba/widgets/user_vacation_card.dart';
import 'package:alibaba/models/user_vacation_model.dart';

// ignore: must_be_immutable
class UserVacationsList extends StatelessWidget {
  UserVacationsList({super.key});

  //make a list of vacations
  List<UserVacationModel> vacations = [
    UserVacationModel(
      date: '1400/01/01',
      price: 166600,
      orderNumber: 123456789,
      orderType: 'پرواز',
    ),
    UserVacationModel(
      date: '1400/01/21',
      price: 156000,
      orderNumber: 123456789,
      orderType: 'پرواز',
    ),
    UserVacationModel(
      date: '1401/01/01',
      price: 157000,
      orderNumber: 123456789,
      orderType: 'تور',
    ),
    UserVacationModel(
      date: '1402/01/01',
      price: 1000345,
      orderNumber: 123456789,
      orderType: 'پرواز',
    ),
    UserVacationModel(
      date: '1400/11/01',
      price: 178000,
      orderNumber: 123456789,
      orderType: 'قطار',
    ),
    UserVacationModel(
      date: '1300/28/01',
      price: 145000,
      orderNumber: 123456789,
      orderType: 'اتوبوس',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vacations.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return UserVacationCard(
          date: vacations[index].date,
          price: vacations[index].price,
          orderNumber: vacations[index].orderNumber,
          orderType: vacations[index].orderType,
        );
      },
    );
  }
}
