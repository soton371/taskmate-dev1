import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart' show HugeIcons;

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_values.dart';
import '../widgets/account_card_list.dart';

class AddExchangePage extends StatefulWidget {
  const AddExchangePage({super.key});

  @override
  State<AddExchangePage> createState() => _AddExchangePageState();
}

class _AddExchangePageState extends State<AddExchangePage> {
  final ValueNotifier<int> _fromIndex = ValueNotifier<int>(0);
  final PageController _fromPageController = PageController(viewportFraction: 0.9);
  final ValueNotifier<int> _toIndex = ValueNotifier<int>(0);
  final PageController _toPageController = PageController(viewportFraction: 0.9);
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _amountFocusNode = FocusNode();

  @override
  void dispose() {
    _fromIndex.dispose();
    _fromPageController.dispose();
    _toIndex.dispose();
    _toPageController.dispose();
    _amountController.dispose();
    _amountFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _fromPageController.addListener(() {
      final page = _fromPageController.page?.round() ?? 0;
      if (_fromIndex.value != page) _fromIndex.value = page;
    });
    _toPageController.addListener(() {
      final page = _toPageController.page?.round() ?? 0;
      if (_toIndex.value != page) _toIndex.value = page;
    });

    // Autofocus amount after slight delay
    Future.delayed(Duration(milliseconds: 300), () {
      _amountFocusNode.requestFocus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Transfer"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:  AppSizes.paddingBody),
            child: _styledTextField(
              _amountController,
              'Enter amount',
              keyboardType: TextInputType.number,
              textStyle: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
              centered: true,
              focusNode: _amountFocusNode,
            ),
          ),
          const SizedBox(height: AppSizes.paddingBody),
          _sectionHeader("Transfer From", HugeIcons.strokeRoundedArrowUp05),
          AccountCardList(
            accounts: AppValues.accountList,
            currentIndex: _fromIndex,
            pageController: _fromPageController,
          ),
      
          const SizedBox(height: 20),
          Divider(height: 32, thickness: 1, color: Colors.grey[300]),
      
          _sectionHeader("Transfer To", HugeIcons.strokeRoundedArrowDown05),
          AccountCardList(
            accounts: AppValues.accountList,
            currentIndex: _toIndex,
            pageController: _toPageController,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(AppSizes.paddingBody),
            child: FilledButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(HugeIcons.strokeRoundedShuffle),
              label: const Text("Transfer"),
              style: FilledButton.styleFrom(
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.paddingInside),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[700]),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
