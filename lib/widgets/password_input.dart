import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  IconData? icon;
  bool? obscureTextState;
  late bool showPassword;
  final TextEditingController _passwordController = TextEditingController();
  PasswordStrength _passwordStrength = PasswordStrength.veryWeak;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    icon = Icons.visibility_off;
    obscureTextState = true;
    showPassword = false;
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void checkPasswordStrength(String password) {
    setState(() {
      _passwordStrength = getPasswordStrength(password);
    });
  }

  PasswordStrength getPasswordStrength(String password) {
    if (password.length < 4) {
      return PasswordStrength.veryWeak;
    } else if (password.length < 6) {
      return PasswordStrength.weak;
    } else if (password.length < 8) {
      if (_hasLowerCase(password) &&
          _hasUpperCase(password) &&
          _hasDigit(password)) {
        return PasswordStrength.strong;
      } else {
        return PasswordStrength.weak;
      }
    } else {
      if (_hasLowerCase(password) &&
          _hasUpperCase(password) &&
          _hasDigit(password) &&
          !_hasRepetitiousWords(password)) {
        return PasswordStrength.veryStrong;
      } else if (_hasLowerCase(password) &&
          _hasUpperCase(password) &&
          _hasDigit(password)) {
        return PasswordStrength.strong;
      } else {
        return PasswordStrength.weak;
      }
    }
  }

  bool _hasLowerCase(String value) => RegExp(r'[a-z]').hasMatch(value);

  bool _hasUpperCase(String value) => RegExp(r'[A-Z]').hasMatch(value);

  bool _hasDigit(String value) => RegExp(r'[0-9]').hasMatch(value);

  bool _hasRepetitiousWords(String value) {
    List<String> words = value.split(' ');
    for (int i = 0; i < words.length - 1; i++) {
      if (value.contains(words[i])) {
        return true;
      }
    }
    return false;
  }

  Color getPasswordStrengthColor(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.veryWeak:
        return Colors.red;
      case PasswordStrength.weak:
        return Colors.orange;
      case PasswordStrength.strong:
        return Colors.greenAccent;
      case PasswordStrength.veryStrong:
        return Colors.green;
    }
  }

  String getPasswordStrengthText(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.veryWeak:
        return 'بسیار ضعیف';
      case PasswordStrength.weak:
        return 'ضعیف';
      case PasswordStrength.strong:
        return 'قوی';
      case PasswordStrength.veryStrong:
        return 'بسیار قوی';
    }
  }

  double _getProgressBarValue(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.veryWeak:
        return 10;
      case PasswordStrength.weak:
        return 45;
      case PasswordStrength.strong:
        return 75;
      case PasswordStrength.veryStrong:
        return 100;
    }
  }

  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;

      if (showPassword) {
        icon = Icons.visibility;
        _timer = Timer(const Duration(seconds: 3), () {
          setState(() {
            showPassword = false;
            icon = Icons.visibility_off;
          });
        });
      } else {
        icon = Icons.visibility_off;
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _passwordController,
              onChanged: checkPasswordStrength,
              obscureText: !showPassword,
              style: const TextStyle(
                fontFamily: 'Vazir',
                fontSize: 16,
              ),
              cursorColor: Colors.black,
              cursorHeight: 24,
              cursorWidth: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  onPressed: togglePasswordVisibility,
                  icon: Icon(icon, color: Colors.grey),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: getPasswordStrengthColor(_passwordStrength),
                    width: 2.5,
                  ),
                ),
                labelStyle: const TextStyle(
                  fontFamily: 'Vazir',
                  color: Colors.grey,
                ),
                labelText: 'رمز عبور',
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.rotationY(3.14159),
                    child: FAProgressBar(
                      progressColor:
                          getPasswordStrengthColor(_passwordStrength),
                      currentValue: _getProgressBarValue(_passwordStrength),
                      size: 8,
                      direction: Axis.horizontal,
                      verticalDirection: VerticalDirection.up,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  getPasswordStrengthText(_passwordStrength),
                  style: TextStyle(
                    fontFamily: 'Vazir',
                    color: getPasswordStrengthColor(_passwordStrength),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum PasswordStrength {
  veryWeak,
  weak,
  strong,
  veryStrong,
}
