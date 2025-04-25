import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_colors.dart';

import '../../../core/constants/app_sizes.dart';

class MessageInputField extends StatelessWidget {
  const MessageInputField();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingBody, vertical: AppSizes.paddingInside),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.cardRadius)),
          border: Border(top: BorderSide(width: 0.5, color: AppColors.border))
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            hintText: 'Type a message...',
            suffixIcon: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
              icon: Icon(Icons.send),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(100),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
