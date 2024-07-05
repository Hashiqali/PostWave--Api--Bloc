import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';

/// Shows a success snackbar with the provided [message].
void snackbarSucess(BuildContext context, String message) {
  IconSnackBar.show(
    context,
    snackBarStyle:
        const SnackBarStyle(labelTextStyle: TextStyle(fontFamily: 'medium')),
    duration: const Duration(seconds: 2),
    snackBarType: SnackBarType.success,
    label: message,
  );
}

/// Shows a failure snackbar with the provided [message].
void snackbarFail(BuildContext context, String message) {
  IconSnackBar.show(
    context,
    duration: const Duration(seconds: 2),
    snackBarType: SnackBarType.fail,
    snackBarStyle:
        const SnackBarStyle(labelTextStyle: TextStyle(fontFamily: 'medium')),
    label: message,
  );
}
