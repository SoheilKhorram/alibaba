import 'package:flutter/material.dart';

class StepperAppBarItem extends StatefulWidget {
  const StepperAppBarItem({
    super.key,
    required this.step,
    required this.currentStep,
    required this.text,
    required this.icon,
  });

  final int step;
  final int currentStep;
  final String text;
  final IconData icon;

  @override
  State<StepperAppBarItem> createState() {
    return _StepperAppBarItemState();
  }
}

class _StepperAppBarItemState extends State<StepperAppBarItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.currentStep == widget.step) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${widget.text}  ',
                  style: const TextStyle(
                    color: Color(0xff28a745),
                    fontFamily: 'Vazir',
                    fontSize: 14,
                  ),
                ),
                WidgetSpan(
                    child: Icon(
                  widget.icon,
                  size: 24,
                  color: const Color(0xff28a745),
                ))
              ],
            ),
          ),
        ),
      );
    }
    if (widget.currentStep < widget.step) {
      return Center(
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Color(0xffbec6cc),
          ),
        ),
      );
    } else {
      return Icon(
        widget.icon,
        size: 24,
        color: const Color(0xff28a745),
      );
    }
  }
}
