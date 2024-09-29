import "package:flutter/material.dart";

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCustomSnackBar({
  required BuildContext context,
  required String message,
}) {
  var snackBar = SnackBar(content: Text(message));

  ScaffoldMessenger.of(context).removeCurrentSnackBar();

  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
