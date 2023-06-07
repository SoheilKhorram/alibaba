import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class DatePickerScreen extends StatefulWidget {
  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  Jalali? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selected Date:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              _selectedDate != null ? _selectedDate.toString() : 'No date selected',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                Jalali? picked = await showPersianDatePicker(
                  context: context,
                  initialDate: Jalali.now(),
                  firstDate: Jalali(1385, 8),
                  lastDate: Jalali(1450, 9),
                );
                if (picked != null) {
                  setState(() {
                    _selectedDate = picked;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              child: const Text(
                'Pick a Date',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TravelDate extends StatefulWidget {
  final String text;

  const TravelDate({Key? key, required this.text}) : super(key: key);

  @override
  _TravelDateState createState() => _TravelDateState();
}

class _TravelDateState extends State<TravelDate> {
  Jalali? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: OutlinedButton.icon(
          icon: const Icon(
            Icons.calendar_month_outlined,
            color: Colors.grey,
            size: 20,
          ),
          label: Text(
            _selectedDate != null ? _selectedDate.toString() : widget.text,
            style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'Vazir',
              fontSize: 15,
            ),
          ),
          onPressed: () async {
            final Jalali? picked = await Navigator.push<Jalali>(
              context,
              MaterialPageRoute(
                builder: (context) => DatePickerScreen(),
              ),
            );
            if (picked != null) {
              setState(() {
                _selectedDate = picked;
              });
            }
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.yellow,
            side: BorderSide.none,
          ),
        ),
      ),
    );
  }
}