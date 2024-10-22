import 'package:balatonivizeken_admin/shared/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';

class FullPageProgressIndicator extends StatelessWidget {
  const FullPageProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: const DoubleBounceIndicator(),
      ),
    );
  }
}