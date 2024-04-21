import 'package:flutter/cupertino.dart';

extension PaddingExtensions on Widget {
  Padding paddingBottom(double padding) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: this,
    );
  }

  Padding paddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(
        padding,
      ),
      child: this,
    );
  }

  Padding paddingVertical(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: padding,
      ),
      child: this,
    );
  }

  Padding paddingSymmetric(
      {required double vertical, required double horizontal}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      child: this,
    );
  }

  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget visible(bool condition, {Widget? defaultWidget}) {
    return condition ? this : defaultWidget ?? const SizedBox();
  }
}