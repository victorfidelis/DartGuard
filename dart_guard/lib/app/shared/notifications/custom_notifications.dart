import 'package:flutter/material.dart';

abstract class CustomNotifications {
  void showSnackBar({
    required BuildContext context,
    required String message,
    Function()? undoAction,
    String? undoLabel,
    Duration duration,
  });

  Future<void> showQuestionAlert({
    required BuildContext context,
    required String title,
    required String content,
    Function() confirmCallback,
    Function() cancelCallback,
  });
}