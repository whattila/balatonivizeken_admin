import 'package:flutter/material.dart';
import '../consts/global_key.dart';

class Snack {
  static SnackBar _snackBar({required String text}) {
    return SnackBar(
      content: Text(text),
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 10),
    );
  }

  static void show(BuildContext context, {required String text}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(_snackBar(text: text));
  }

  static void showWithoutContext({required String text}) {
    globalKey.currentState?.hideCurrentSnackBar();
    globalKey.currentState?.showSnackBar(_snackBar(text: text));
  }
}