import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Utils {
  static String formatNumber(String s) => NumberFormat.simpleCurrency(
        locale: 'ID',
        decimalDigits: 0,
      ).format(
        int.parse(s),
      );

  static toastMessage(String message) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );

  static void flushBarErrorMessage(
    String message,
    BuildContext context,
  ) =>
      showFlushbar(
          context: context,
          flushbar: Flushbar(
            forwardAnimationCurve: Curves.decelerate,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.all(15),
            duration: const Duration(seconds: 3),
            borderRadius: BorderRadius.circular(8),
            message: message,
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Colors.red,
            reverseAnimationCurve: Curves.easeInOut,
            positionOffset: 20,
            icon: const Icon(Icons.error, size: 28, color: Colors.white),
          )..show(context));

  static snackBar(
    String message,
    BuildContext context,
  ) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message),
        ),
      );
}
