import 'package:flutter/material.dart';

showAlertDialogWithOkButton({required BuildContext context, required String message, required VoidCallback okButtonPressed}) {
  // set up the buttons
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      okButtonPressed();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Alert"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog({required BuildContext context, required String message, required VoidCallback cancelButtonPressed, required VoidCallback continueButtonPressed}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      cancelButtonPressed();
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Continue"),
    onPressed: () {
      continueButtonPressed();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Alert"),
    content: Text(message),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
