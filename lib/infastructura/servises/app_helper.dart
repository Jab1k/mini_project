import 'package:flutter/material.dart';
import 'package:setup_provider/presentation/style/style.dart';

abstract class AppHelper {
  AppHelper._();

  static errorDialog(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          );
        });
  }

  static errorSnackBar({required BuildContext context,required String message}){
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      backgroundColor: Style.errorLight,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Text(
        message,
        style: Style.normal(
          size: 14,
          color: Style.white,
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        disabledTextColor: Style.white,
        textColor: Style.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
