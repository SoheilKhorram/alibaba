import 'package:flutter/material.dart';

const List<String> list = <String>[
  'زودترین',
  'دیرترین',
  'ارزانترین',
  'گرانترین'
];

class SortingDropDown extends StatefulWidget {
  final void Function(String?) onChanged;

  const SortingDropDown({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<SortingDropDown> createState() => _SortingDropDownState();
}

class _SortingDropDownState extends State<SortingDropDown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10000),
          border: Border.all(
            color: const Color(0xff0077db),
            width: 1,
          ),
          color: const Color(0xfff2f9ff),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              offset: Offset(0, 1.2),
            ),
          ],
        ),
        child: DropdownButton<String>(
          alignment: Alignment.center,
          isDense: true,
          icon: const Icon(
            Icons.swap_vert,
            color: Color(0xff0077db),
            size: 20,
          ),
          elevation: 16,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'vazir',
            fontSize: 16,
          ),
          value: dropdownValue,
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value;
            });
            widget.onChanged(value);

          },
          hint: const Text(
            'مرتب سازی',
            style: TextStyle(
              fontFamily: 'Vazir',
              fontSize: 16,
              color: Color(0xff0077db),
              fontWeight: FontWeight.w400,
            ),
          ),
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(value),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

