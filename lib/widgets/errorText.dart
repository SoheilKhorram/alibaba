import 'package:flutter/material.dart';

class NameInput extends StatefulWidget {
  const NameInput({Key? key}) : super(key: key);

  @override
  _NameInputState createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  final TextEditingController _nameController = TextEditingController();
  bool _showError = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void validateInput(String value) {
    setState(() {
      _showError = value.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                onChanged: validateInput,
                onEditingComplete: () {
                  validateInput(_nameController.text);
                },
                style: const TextStyle(
                  fontFamily: 'Vazir',
                  fontSize: 16,
                ),
                cursorColor: Colors.black,
                cursorHeight: 24,
                cursorWidth: 1,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Color(0xFFFDB713),
                      width: 2.5,
                    ),
                  ),
                  labelStyle: TextStyle(fontFamily: 'Vazir', color: Colors.grey),
                  labelText: 'نام کاربری',
                ),
              ),
              if (_showError) ErrorWidget('نام نمی‌تواند خالی باشد'),
            ],
          ),
        ),
      ),
    );
  }
}
