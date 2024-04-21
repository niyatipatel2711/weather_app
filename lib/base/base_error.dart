import 'package:flutter/material.dart';

void baseError({required String errorText, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: Theme.of(context).primaryColor,
      content: Text(
        errorText,
      ),
    ),
  );
}
