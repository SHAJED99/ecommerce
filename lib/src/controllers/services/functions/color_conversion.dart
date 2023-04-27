import 'package:flutter/material.dart';

Color colorConversion(String colorHex) {
  return Color(int.parse(colorHex.substring(1, 7), radix: 16) + 0xFF000000);
}
