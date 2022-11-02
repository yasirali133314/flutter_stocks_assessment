import 'package:flutter/material.dart';
import 'package:flutter_stocks_assessment/constants/constants.dart';

class Snackbars {
  Snackbars._();

  static void showError(String error) {
    _show(
      title: 'Error',
      message: error,
      backgroundColor: Colors.red,
    );
  }

  static void _show({
    required String title,
    required String message,
    required Color backgroundColor,
  }) {
    final snackbar = SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            message,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          )
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
    ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
        .showSnackBar(snackbar);
  }
}
