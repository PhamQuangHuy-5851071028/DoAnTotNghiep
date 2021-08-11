import 'package:flutter/material.dart';

import 'custom_alertdialog.dart';

class DialogHelper {
  static exit(context) => showDialog(
        context: context,
        builder: (context) => ExitConfirmationDialog(),
        barrierDismissible: false,
      );
}
