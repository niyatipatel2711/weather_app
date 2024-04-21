import 'package:weather_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import '../constants/size_constants.dart';
import '../constants/style_constants.dart';

class Buttons {
  static outlinedButton(
      {required BuildContext context,
      required String text,
      void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: SizeConstants.radiusAll8,
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Text(
          text,
          style: StyleConstants.labelFont14Primary(context: context),
        ).center().paddingSymmetric(
            vertical: SizeConstants.size12, horizontal: SizeConstants.size24),
      ),
    );
  }
}
