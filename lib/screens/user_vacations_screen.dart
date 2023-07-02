import 'package:alibaba/widgets/order_search.dart';
import 'package:alibaba/widgets/user_vacations_app_bar.dart';
import 'package:alibaba/widgets/user_vacations_list.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class UserVacationsScreen extends StatefulWidget {
  final Jalali? selectedFromDate;
  final Jalali? selectedToDate;
  final int? selectedOrderNumber;

  const UserVacationsScreen({
    Key? key,
    this.selectedFromDate,
    this.selectedToDate,
    this.selectedOrderNumber,
  }) : super(key: key);

  @override
  _UserVacationsScreenState createState() => _UserVacationsScreenState();
}

class _UserVacationsScreenState extends State<UserVacationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserVacationsAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              OrderSearch(
                onFilter: (fromDate, toDate, orderNumber) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserVacationsScreen(
                        selectedFromDate: fromDate,
                        selectedToDate: toDate,
                        selectedOrderNumber: orderNumber,
                      ),
                    ),
                  );
                },
              ),
              UserVacationsList(
                selectedFromDate: widget.selectedFromDate,
                selectedToDate: widget.selectedToDate,
                selectedOrderNumber: widget.selectedOrderNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
