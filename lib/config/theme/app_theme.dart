import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF2196F3);
const List<Color> _listCustomColors = [
  _customColor,
  Colors.deepPurpleAccent,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  ThemeData theme([int indexColor = 0]) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed:
          _listCustomColors[indexColor < 0 ||
                  indexColor >= _listCustomColors.length
              ? 0
              : indexColor],
      brightness: Brightness.dark,
    );
  }
}
