import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../constants/color_constants.dart';
import '../constants/size_constants.dart';
import '../constants/style_constants.dart';

class BaseTextField extends StatefulWidget {
  const BaseTextField(
      {Key? key,
      this.hintText,
      required this.controller,
      this.textInputType,
      required this.isRequired,
      required this.isButtonPressed,
      this.isDisabled = false,
      this.onChanged})
      : super(key: key);

  final String? hintText;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool isRequired;
  final bool isButtonPressed;
  final bool isDisabled;
  final void Function(String)? onChanged;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.isDisabled,
      controller: widget.controller,
      style: StyleConstants.labelFont14Black,
      keyboardType: widget.textInputType ?? TextInputType.text,
      autovalidateMode: widget.isButtonPressed
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: ColorConstants.white,
        border: OutlineInputBorder(
            borderRadius: SizeConstants.radiusAll12,
            borderSide: const BorderSide(color: ColorConstants.black)),
      ),
      validator: (value) {
        if ((value == null || value.isEmpty) && widget.isRequired) {
          return AppConstants.required;
        }
        return null;
      },
      onChanged: widget.onChanged,
    );
  }
}
