import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_sizes.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final taskCon = TextEditingController();
  final detailsCon = TextEditingController();

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
    super.dispose();
  }

  void _saveTask() {
    final taskText = taskCon.text.trim();
    final detailsText = detailsCon.text.trim();

    // 🔥 Bloc বা Provider logic এখানে কল করো
    debugPrint("Saving task: $taskText, details: $detailsText");

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
        children: [
          TextFormField(
            controller: taskCon,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'New task',
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
                onPressed: () {},
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
