import 'package:flutter/material.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  bool _showError = false;

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  bool _validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    }
    const emailRegex = r'^\w+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]{2,}$';
    return RegExp(emailRegex).hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            controller: widget.controller,
            onChanged: (value) {
              setState(() {
                _showError = !_validateEmail(value);
              });
            },
            onEditingComplete: () {
              setState(() {
                _showError = !_validateEmail(widget.controller.text);
              });
            },
            style: const TextStyle(
              fontFamily: 'Vazir',
              fontSize: 16,
            ),
            cursorColor: Colors.black,
            cursorHeight: 24,
            cursorWidth: 1,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.mail_outline,
                color: Colors.grey,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: Color(0xFFFDB713),
                  width: 2.5,
                ),
              ),
              labelStyle:
                  const TextStyle(fontFamily: 'Vazir', color: Colors.grey),
              labelText: 'ایمیل',
              errorText: _showError ? 'ایمیل نامعتبر است' : null,
              errorStyle: const TextStyle(
                fontFamily: 'Vazir',
                fontSize: 12,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
