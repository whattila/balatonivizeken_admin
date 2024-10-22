import 'package:flutter/material.dart';
import '../consts/global_key.dart';

class NetworkIssue {
  static void showSnackbar() {
    globalKey.currentState?.hideCurrentSnackBar();
    globalKey.currentState?.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 10),
        content: const Text('Időtúllépés, kérjük próbálja újra, vagy ellenőrízze internet kapcsolatát!'),
        action: SnackBarAction(label: 'close', onPressed: () => globalKey.currentState?.hideCurrentSnackBar()),
      ),
    );
  }
}