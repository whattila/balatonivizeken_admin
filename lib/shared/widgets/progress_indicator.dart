import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../consts/colors.dart';

class DoubleBounceIndicator extends StatelessWidget {
  const DoubleBounceIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitDoubleBounce(
      color: BalatoniVizekenColors.lightBlack,
      size: 64,
    );
  }
}