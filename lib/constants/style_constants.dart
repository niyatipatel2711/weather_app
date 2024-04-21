import 'package:flutter/material.dart';
import 'package:weather_app/constants/size_constants.dart';

import 'color_constants.dart';

class StyleConstants {
  static const TextStyle labelFont14Black = TextStyle(
      color: ColorConstants.black,
      fontSize: SizeConstants.size14,
      fontStyle: FontStyle.normal);
  static const TextStyle labelFont14Red = TextStyle(
      color: Colors.red,
      fontSize: SizeConstants.size14,
      fontStyle: FontStyle.normal);

  static TextStyle labelFont14Primary(
      {required BuildContext context, bool isBold = false}) {
    return TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: SizeConstants.size14,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal);
  }
}
