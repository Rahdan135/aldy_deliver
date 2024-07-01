import 'package:flutter/material.dart';

class CustomSnackBar {
  static showSnack(context, String message, Color color) {
    final ThemeData theme = Theme.of(context);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message,
          style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white,),textDirection: TextDirection.rtl,),
      backgroundColor: color,
    ));
  }
}
