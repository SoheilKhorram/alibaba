import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10000)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        ),
        onPressed: () {},
        icon: const Icon(Icons.filter_list, color: Colors.black, size: 20),
        label: const Text(
          "فیلترها",
          style: TextStyle(
            fontFamily: 'Vazir',
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
