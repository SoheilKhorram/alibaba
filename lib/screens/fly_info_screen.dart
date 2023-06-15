import 'package:flutter/material.dart';

import 'package:alibaba/widgets/fly_info_app_bar.dart';

class FlyInfoScreen extends StatelessWidget {
  const FlyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: FlyInfoAppBar(),
    );
  }
}
