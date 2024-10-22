import 'package:flutter/material.dart';
import '../../../shared/consts/colors.dart';

class LandingScreenDivider extends StatelessWidget {
  const LandingScreenDivider({super.key});

  Widget _partialDivider(BuildContext context) {
    return const Expanded(child: Divider(color: BalatoniVizekenColors.lightGrey));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _partialDivider(context),
        const SizedBox(width: 8),
        const Text(
          'Vagy',
          style: TextStyle(color: BalatoniVizekenColors.lightGrey, height: 1),
        ),
        const SizedBox(width: 8),
        _partialDivider(context),
      ],
    );
  }
}