import 'package:flutter/material.dart';

extension IntExtension on int? {
  int validate({int value = 0}) {
    return this ?? value;
  }

  Widget get kh => SizedBox(height: this?.toDouble());
  Widget get kw => SizedBox(width: this?.toDouble());
}
