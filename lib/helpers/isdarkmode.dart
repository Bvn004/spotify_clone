import 'package:flutter/material.dart';

extension Darkmode on BuildContext {
  bool get isDarkmode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
