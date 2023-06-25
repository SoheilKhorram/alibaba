import 'package:alibaba/widgets/stepper_app_bar.dart';
import 'package:alibaba/widgets/ticket_info.dart';
import 'package:flutter/material.dart';

class InfoConfirmationScreen extends StatelessWidget {
  const InfoConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StepperAppBar(step: 3),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [TicketInfo()],
        ),
      ),
    );
  }
}
