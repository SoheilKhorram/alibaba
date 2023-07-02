import 'package:flutter/material.dart';

import 'package:alibaba/widgets/user_vacation_card.dart';
import 'package:alibaba/models/user_vacation_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

// ignore: must_be_immutable
class UserVacationsList extends StatelessWidget {
  final Jalali? selectedFromDate;
  final Jalali? selectedToDate;
  final int? selectedOrderNumber;


  UserVacationsList({
    this.selectedFromDate,
    this.selectedToDate,
    this.selectedOrderNumber,
    super.key
  });

  //make a list of vacations
  List<UserVacationModel> vacations = [
    UserVacationModel(
      date: '1402/06/10',
      price: 166600,
      orderNumber: 1239008,
      orderType: 'پرواز',
    ),
    UserVacationModel(
      date: '1401/9/21',
      price: 156000,
      orderNumber: 11456789,
      orderType: 'پرواز',
    ),
    UserVacationModel(
      date: '1401/8/01',
      price: 157000,
      orderNumber: 7898812,
      orderType: 'تور',
    ),
    UserVacationModel(
      date: '1402/01/01',
      price: 1000345,
      orderNumber: 12375678,
      orderType: 'پرواز',
    ),
    UserVacationModel(
      date: '1402/11/01',
      price: 178000,
      orderNumber: 123456789,
      orderType: 'قطار',
    ),
    UserVacationModel(
      date: '1403/2/01',
      price: 145000,
      orderNumber: 123456789,
      orderType: 'اتوبوس',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    List<UserVacationModel> filteredVacations = vacations.where((vacation) {
      if (selectedFromDate != null && vacation.date != selectedFromDate.toString()) {
        return false;
      }
      if (selectedToDate != null && vacation.date != selectedToDate.toString()) {
        return false;
      }
      if (selectedOrderNumber != null && vacation.orderNumber != selectedOrderNumber) {
        return false;
      }
      return true;
    }).toList();

    return ListView.builder(
      itemCount: filteredVacations.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final vacation = filteredVacations[index];

        if (selectedFromDate != null && vacation.date != selectedFromDate.toString()) {
          return const SizedBox.shrink();
        }

        if (selectedToDate != null && vacation.date != selectedToDate.toString()) {
          return const SizedBox.shrink();
        }

        if (selectedOrderNumber != null && vacation.orderNumber != selectedOrderNumber) {
          return const SizedBox.shrink();
        }

        return UserVacationCard(
          date: vacation.date,
          price: vacation.price,
          orderNumber: vacation.orderNumber,
          orderType: vacation.orderType,
        );
      },
    );
  }
}
