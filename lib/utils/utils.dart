import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // This can be left empty if no action is needed
          },
        ),
      ),
    );
  }
 static Future<DateTime?> selectDate(BuildContext context, DateTime dateTime) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: dateTime,
    firstDate: DateTime(1960),
    lastDate: DateTime.now(),
  );
  return pickedDate;
}

}