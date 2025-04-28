import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_sizes.dart';

import '../../../../core/constants/app_values.dart';
import '../widgets/account_card_list.dart';

class AddExpenseEarningPage extends StatefulWidget {
  const AddExpenseEarningPage({super.key, required this.title});
  final String title;

  @override
  State<AddExpenseEarningPage> createState() => _AddExpenseEarningPageState();
}

class _AddExpenseEarningPageState extends State<AddExpenseEarningPage> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  final PageController _pageController = PageController(viewportFraction: 0.9);
  final ValueNotifier<int?> _selectedCategoryIndex = ValueNotifier(null);
  final ValueNotifier<bool> _showAllCategories = ValueNotifier(false);
  final ValueNotifier<DateTime> _selectedDateTime = ValueNotifier(DateTime.now());

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _amountFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (_currentIndex.value != page) {
        _currentIndex.value = page;
      }
    });

    // Autofocus amount after slight delay
    Future.delayed(Duration(milliseconds: 300), () {
      _amountFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentIndex.dispose();
    _selectedCategoryIndex.dispose();
    _showAllCategories.dispose();
    _selectedDateTime.dispose();
    _titleController.dispose();
    _amountController.dispose();
    _amountFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Add ${widget.title}")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _styledTextField(_titleController, 'Title',),
                const SizedBox(height: AppSizes.paddingBody),
                _styledTextField(
                  _amountController,
                  'Amount',
                  keyboardType: TextInputType.number,
                  textStyle: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  centered: true,
                  focusNode: _amountFocusNode,
                ),
                const SizedBox(height: AppSizes.paddingBody),
                ValueListenableBuilder<bool>(
                  valueListenable: _showAllCategories,
                  builder: (_, showAll, __) {
                    final categories = showAll
                        ? AppValues.categoryList
                        : AppValues.categoryList.take(5).toList();
                    return Wrap(
                      spacing: AppSizes.paddingInside,
                      runSpacing: AppSizes.paddingInside,
                      children: [
                        ...List.generate(categories.length, (i) {
                          final cat = categories[i];
                          return ValueListenableBuilder<int?>(
                            valueListenable: _selectedCategoryIndex,
                            builder: (_, selectedIndex, __) {
                              final isSelected = selectedIndex == i;
                              return GestureDetector(
                                onTap: () => _selectedCategoryIndex.value = i,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingInside, vertical: AppSizes.paddingInside / 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: isSelected ? cat.color.withValues(alpha: 0.9) : Colors.grey[200],
                                    boxShadow: isSelected
                                        ? [BoxShadow(color: cat.color, blurRadius: 6, offset: Offset(1, 2))]
                                        : [],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(cat.icon, color: isSelected ? Colors.white : Colors.black54),
                                      const SizedBox(width: AppSizes.paddingInside),
                                      Text(cat.title,
                                          style: TextStyle(
                                              color: isSelected ? Colors.white : Colors.black87,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                        if (!showAll)
                          GestureDetector(
                            onTap: () => _showAllCategories.value = true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingInside, vertical: AppSizes.paddingInside / 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey[300],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(HugeIcons.strokeRoundedMoreHorizontal, color: Colors.grey),
                                  const SizedBox(width: AppSizes.paddingInside),
                                  const Text("Show More", style: TextStyle(fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.paddingBody),
          // Account Card
          AccountCardList(
            accounts: AppValues.accountList,
            currentIndex: _currentIndex,
            pageController: _pageController,
          ),
          const SizedBox(height: AppSizes.paddingBody),
          Padding(padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody), child: Column(
            children: [
              // Date Picker
                ValueListenableBuilder<DateTime>(
                  valueListenable: _selectedDateTime,
                  builder: (_, selectedDateTime, __) {
                    final formattedDate = "${selectedDateTime.day.toString().padLeft(2, '0')}/${selectedDateTime.month.toString().padLeft(2, '0')}/${selectedDateTime.year}";
                    final formattedTime = "${selectedDateTime.hour.toString().padLeft(2, '0')}:${selectedDateTime.minute.toString().padLeft(2, '0')}";
            
                    return GestureDetector(
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDateTime,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
            
                        if (pickedDate != null) {
                          final pickedTime = await showTimePicker(
                            // ignore: use_build_context_synchronously
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(selectedDateTime),
                          );
            
                          if (pickedTime != null) {
                            _selectedDateTime.value = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                          } else {
                            // Only date picked
                            _selectedDateTime.value = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              selectedDateTime.hour,
                              selectedDateTime.minute,
                            );
                          }
                        }
                      },
                      child: Padding(
                        padding:  EdgeInsets.all(AppSizes.paddingInside),
                        child: Row(
                          children: [
                            HugeIcon(
                              icon: HugeIcons.strokeRoundedCalendar03,
                              color: AppColors.seed,
                              size: 30.0,
                            ),
                            const SizedBox(width: AppSizes.paddingInside),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${widget.title} Date", style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                                const SizedBox(height: 4),
                                Text(
                                  formattedDate,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("${widget.title} Time", style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                                const SizedBox(height: 4),
                                Text(
                                  formattedTime,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            HugeIcon(
                              icon: HugeIcons.strokeRoundedTimeQuarter02,
                              color: Color(0xff1488cc),
                              size: 30.0,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ],
          )),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(AppSizes.paddingBody),
            child: FilledButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(HugeIcons.strokeRoundedAdd01),
              label: const Text("Add"),
              style: FilledButton.styleFrom(
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _styledTextField(
    TextEditingController controller,
    String hint, {
    IconData? prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    TextStyle? textStyle,
    bool centered = false,
    FocusNode? focusNode,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      textAlign: centered ? TextAlign.center : TextAlign.start,
      style: textStyle,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      ),
    );
  }
}
