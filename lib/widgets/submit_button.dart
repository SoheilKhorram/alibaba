import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
    this.text, {
    Key? key,
    this.backgroundColor,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xFFFDB713),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Vazir',
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
