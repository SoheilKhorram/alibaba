import 'package:flutter/material.dart';

class NameInput extends StatefulWidget {
  const NameInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  _NameInputState createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  bool _showError = false;

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  void validateInput(String value) {
    setState(() {
      _showError = value.isEmpty;
    });
  }

  TextStyle _getErrorTextStyle() {
    return const TextStyle(
      fontFamily: 'Vazir',
      fontSize: 12,
      color: Colors.red,
    );
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
            onChanged: validateInput,
            onEditingComplete: () {
              validateInput(widget.controller.text);
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
                Icons.person_outline,
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
              labelText: 'نام کاربری',
              errorText: _showError ? 'نام نمی‌تواند خالی باشد' : null,
              errorStyle: _getErrorTextStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
