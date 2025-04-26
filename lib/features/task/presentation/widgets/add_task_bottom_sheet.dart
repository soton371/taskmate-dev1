import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_sizes.dart';
import 'package:taskmate/core/services/db_services.dart';

import '../../../../core/utilities/app_date_time.dart';
import '../../data/models/task_title_list_isar_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key, required this.taskTitleListIsarModel});

  final TaskTitleListIsarModel taskTitleListIsarModel;

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final taskCon = TextEditingController();
  final detailsCon = TextEditingController();
  final taskDateTimeNotifier = ValueNotifier<DateTime?>(null);

  bool showDetailsField = false;
  bool isSaveEnabled = false;

  @override
  void initState() {
    super.initState();
    taskCon.addListener(_handleInputChange);
  }

  void _handleInputChange() {
    final hasText = taskCon.text.trim().isNotEmpty;
    if (hasText != isSaveEnabled) {
      setState(() {
        isSaveEnabled = hasText;
      });
    }
  }

  @override
  void dispose() {
    taskCon.dispose();
    detailsCon.dispose();
    taskDateTimeNotifier.dispose();
    super.dispose();
  }

  void _saveTask() async {
    final taskText = taskCon.text.trim();
    if (taskText.isEmpty) return;
    final detailsText = detailsCon.text.trim();
    final newTask =
        TaskIsarModel()
          ..name = taskText
          ..details = detailsText.isEmpty ? null : detailsText
          ..createdAt = DateTime.now().toIso8601String();

    final db = DBServices.db;
    await db.writeTxn(() async {
      await db.taskIsarModels.put(newTask);
      widget.taskTitleListIsarModel.tasks.add(newTask);
      await widget.taskTitleListIsarModel.tasks.save();
    });

    Navigator.pop(context); // Optional: dismiss modal
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppSizes.paddingBody,
        right: AppSizes.paddingBody,
        top: AppSizes.paddingBody,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSizes.paddingBody,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: taskCon,
            autofocus: true,
            style: TextStyle(fontWeight: FontWeight.w600),
            decoration: const InputDecoration(
              hintText: 'New task',
              hintStyle: TextStyle(fontWeight: FontWeight.w600),
              border: InputBorder.none,
            ),
          ),
          if (showDetailsField)
            TextFormField(
              controller: detailsCon,
              decoration: const InputDecoration(
                hintText: 'Add details',
                border: InputBorder.none,
              ),
            ),
          ValueListenableBuilder<DateTime?>(
            valueListenable: taskDateTimeNotifier,
            builder: (_, value, child) {
              return value == null
                  ? SizedBox.shrink()
                  : Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppColors.randomPastelColor().withValues(
                        alpha: 0.1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          formatDateTime(
                                dateTime: value,
                                format: 'E, dd MMM hh:mm a',
                              ) ??
                              '',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 5,),
                        InkWell(
                          onTap: () {
                            taskDateTimeNotifier.value = null;
                          },
                          child: Icon(Icons.close, size: 16,),
                        ),
                      ],
                    ),
                  );
            },
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    showDetailsField = true;
                  });
                },
                icon: const Icon(Icons.format_align_left),
              ),
              IconButton(
                onPressed: () async {
                  final dd = await pickCupertinoDateTime(
                    context,
                    withTime: true,
                  );
                  if (dd != null) {
                    taskDateTimeNotifier.value = dd;
                  }
                },
                icon: const Icon(Icons.watch_later_outlined),
              ),
              const Spacer(),
              TextButton(
                onPressed: isSaveEnabled ? _saveTask : null,
                child: const Text(
                  "Save",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
