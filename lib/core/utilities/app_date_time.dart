import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';



Future<DateTime?> pickCupertinoDateTime(BuildContext context, {bool? withTime}) async {
  DateTime? selectedDateTime;

  return await showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (_) => CupertinoActionSheet(
      actions: [
        SizedBox(
          height: 250,
          child: CupertinoDatePicker(
            mode: withTime == true ? CupertinoDatePickerMode.dateAndTime : CupertinoDatePickerMode.date,
            minimumDate: DateTime.now(),
            onDateTimeChanged: (DateTime newDateTime) {
              selectedDateTime = newDateTime;
            },
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Done'),
        onPressed: () {
          Navigator.of(context).pop(selectedDateTime);
        },
      ),
    ),
  );
}



String? formatDateTime({dynamic dateTime, String? format}) {
  if (dateTime == null) {
    return null;
  }

  try {
    final dateFormatter = DateFormat(format ?? 'dd MMM yyyy');
    if (dateTime is DateTime) {
      return dateFormatter.format(dateTime.toLocal());
    }

    final DateTime parsedDate = DateTime.parse(dateTime);
    return dateFormatter.format(parsedDate);
  } catch (e) {
    if (kDebugMode) {
      print("object convertDateTime e: $e");
    }
    return null;
  }
}

