import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerator {
  Color _previousColor = Colors.white;
  Color _currentColor = Colors.white;
  Color get currentColor => _currentColor;
  Color? get previousColor => _previousColor;

  void generateColor() {
    _previousColor = _currentColor;
    Random random = Random();
    _currentColor = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  void setPreviousColorToCurrent() {
    _currentColor = _previousColor;
  }

  bool isDarkColor() {
    double luminance = (0.299 * _currentColor.red +
        0.587 * _currentColor.green +
        0.114 * _currentColor.blue);
    return luminance < 128;
  }
}
