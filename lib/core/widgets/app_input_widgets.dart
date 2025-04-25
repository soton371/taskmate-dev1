import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

Future<void> appBottomSheet(BuildContext context,
    {required Widget child}) async {
  await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: AppColors.scaffoldBg,
      builder: (context) => Container(
          padding: const EdgeInsets.only(
            left: AppSizes.paddingBody,
            bottom: AppSizes.paddingBody,
            right: AppSizes.paddingBody,
          ),
          child: child));
}

class AppTextField extends StatelessWidget {
  const AppTextField(
      {this.textInputAction,
        required this.hintText,
        required this.labelText,
        this.keyboardType,
        required this.controller,
        super.key,
        this.onChanged,
        this.validator,
        this.obscureText,
        this.suffixIcon,
        this.autofocus,
        this.focusNode,
        this.readOnly = false});

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String hintText;
  final String labelText;
  final bool? autofocus;
  final bool readOnly;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
        SizedBox(height: 8,),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: TextCapitalization.sentences,
          focusNode: focusNode,
          onChanged: onChanged,
          autofocus: autofocus ?? false,
          validator: validator,
          obscureText: obscureText ?? false,
          obscuringCharacter: '*',
          readOnly: readOnly,
          cursorColor: AppColors.seed,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14),
              filled: true,
              isDense: true,
              fillColor: AppColors.fill,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.textFieldRadius)),),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.textFieldRadius)),),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.textFieldRadius)),),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.textFieldRadius)),),
          ),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ],
    );
  }
}


