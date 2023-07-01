import 'package:alibaba/widgets/stepper_app_bar_item.dart';
import 'package:flutter/material.dart';

class StepperAppBar extends StatefulWidget implements PreferredSizeWidget {
  const StepperAppBar({super.key, required this.step});

  final int step;

  @override
  State<StepperAppBar> createState() {
    return _StepperAppBarState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _StepperAppBarState extends State<StepperAppBar> {
  @override
  Widget build(BuildContext context) {
    int currentStep = widget.step;

    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        StepperAppBarItem(
          step: 5,
          currentStep: currentStep,
          text: 'صدور بلیط',
          icon: Icons.done,
        ),
        const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0x38000000),
          size: 18,
        ),
        StepperAppBarItem(
          step: 4,
          currentStep: currentStep,
          text: 'پرداخت',
          icon: Icons.credit_card,
        ),
        const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0x38000000),
          size: 18,
        ),
        StepperAppBarItem(
          step: 3,
          currentStep: currentStep,
          text: ' تایید اطلاعات',
          icon: Icons.format_list_bulleted_rounded,
        ),
        const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0x38000000),
          size: 18,
        ),
        StepperAppBarItem(
          step: 2,
          currentStep: currentStep,
          text: 'مسافران',
          icon: Icons.people,
        ),
        const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0x38000000),
          size: 18,
        ),
        StepperAppBarItem(
          step: 1,
          currentStep: currentStep,
          text: 'پرواز',
          icon: Icons.airplanemode_active,
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}
