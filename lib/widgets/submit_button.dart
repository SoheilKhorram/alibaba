import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
<<<<<<< HEAD
  const SubmitButton(this.text, {super.key, this.color});

  final String text;
  final Color? color;
=======
  const SubmitButton(this.text, {super.key, this.backgroundColor});

  final String text;
  final Color? backgroundColor;
>>>>>>> Steper_page

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
<<<<<<< HEAD
          backgroundColor: color ?? const Color(0xFFFDB713),
=======
          backgroundColor: backgroundColor ?? const Color(0xFFFDB713),
>>>>>>> Steper_page
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
<<<<<<< HEAD
            color: color == null ? Colors.black : Colors.white,
=======
            color: backgroundColor != null ? Colors.white : Colors.black,
>>>>>>> Steper_page
            fontFamily: 'Vazir',
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
