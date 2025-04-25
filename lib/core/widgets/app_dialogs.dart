import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Future<void> appAlertDialog(
    BuildContext context, {
      String? title,
      String? content,
      bool barrierDismissible = true,
      bool defaultDismissAction = true,
      List<Widget>? actions,
    }) async {
  actions ??= [];
  if (defaultDismissAction) {
    actions.add(
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Dismiss",
        ),
      ),
    );
  }

  final alert = AlertDialog.adaptive(
      backgroundColor: AppColors.scaffoldBg,
      title: Text(title ?? 'Sorry!'),
      content: Text(
        content ?? 'Something went wrong',
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      actions: actions);
  await showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}