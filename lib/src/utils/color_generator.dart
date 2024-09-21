import 'dart:math';
import 'package:flutter/material.dart';

/// This class handles generating and managing random colors.
/// It also helps keep track of the previous color and figure out
/// if the current color is dark or light.
class ColorGenerator {
  Color _previousColor = Colors.white;
  Color _currentColor = Colors.white;

  /// Gets the current random color.
  Color get currentColor => _currentColor;

  /// Gets the last color we had before the current one.
  Color? get previousColor => _previousColor;

  /// Generates a new random color and updates the previous color.
  ///
  /// Every time this is called, the current color becomes the previous one,
  /// and a new random color gets generated. This uses RGB values with full
  /// opacity.
  void generateColor() {
    _previousColor = _currentColor;
    final Random random = Random();
    const int maxColorValue = 255;
    const double opacity = 1.0;
    _currentColor = Color.fromRGBO(
      random.nextInt(maxColorValue + 1),
      random.nextInt(maxColorValue + 1),
      random.nextInt(maxColorValue + 1),
      opacity,
    );
  }

  /// Reverts the current color back to the previous color.
  ///
  /// If you want to undo the last color change, just call this.
  void setPreviousColorToCurrent() {
    _currentColor = _previousColor;
  }

  /// Checks if the current color is on the darker side.
  ///
  /// This method calculates the luminance of the current color. If the
  /// luminance is below a certain threshold, we consider it a dark color.
  /// Returns `true` if the color is dark, otherwise `false`.
  bool isDarkColor() {
    const double luminanceThreshold = 128;
    final double luminance = 0.299 * _currentColor.red +
        0.587 * _currentColor.green +
        0.114 * _currentColor.blue;

    return luminance < luminanceThreshold;
  }

  /// Resets both the current and previous colors back to white.
  ///
  /// Just a quick way to reset everything if needed.
  void reset() {
    _currentColor = Colors.white;
    _previousColor = Colors.white;
  }
}
