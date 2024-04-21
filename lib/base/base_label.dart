import 'package:weather_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import '../constants/string_constants.dart';
import '../constants/style_constants.dart';

class BaseLabel extends StatelessWidget {
  const BaseLabel({Key? key, required this.label, this.isRequired = false})
      : super(key: key);

  final String label;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: StyleConstants.labelFont14Black,
        ),
        const Text(
          StringConstants.asterisk,
          style: StyleConstants.labelFont14Red,
        ).visible(isRequired),
      ],
    );
  }
}
