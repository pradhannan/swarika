import 'package:flutter/material.dart';

class ColorPaletteData {
  final String name;
  final Color lightBackground;
  final Color lightSurface;
  final Color lightPrimary;
  final Color lightText;
  final Color darkBackground;
  final Color darkSurface;
  final Color darkPrimary;
  final Color darkText;

  const ColorPaletteData({
    required this.name,
    required this.lightBackground,
    required this.lightSurface,
    required this.lightPrimary,
    required this.lightText,
    required this.darkBackground,
    required this.darkSurface,
    required this.darkPrimary,
    required this.darkText,
  });
}

const List<ColorPaletteData> colorPalettes = [
  ColorPaletteData(
    name: 'Obsidian & Platinum',
    lightBackground: Color(0xFFF4F5F6),
    lightSurface: Color(0xFFFFFFFF),
    lightPrimary: Color(0xFF586574),
    lightText: Color(0xFF202830),
    darkBackground: Color(0xFF12161B),
    darkSurface: Color(0xFF1E242B),
    darkPrimary: Color(0xFFB7C5D4),
    darkText: Color(0xFFF0F3F6),
  ),
  ColorPaletteData(
    name: 'Oxblood & Rose',
    lightBackground: Color(0xFFF7F1F2),
    lightSurface: Color(0xFFFFFFFF),
    lightPrimary: Color(0xFF874653),
    lightText: Color(0xFF302328),
    darkBackground: Color(0xFF1A1417),
    darkSurface: Color(0xFF292025),
    darkPrimary: Color(0xFFD18A9A),
    darkText: Color(0xFFF5EDF0),
  ),
  ColorPaletteData(
    name: 'Deep Ocean & Azure',
    lightBackground: Color(0xFFF1F5F8),
    lightSurface: Color(0xFFFFFFFF),
    lightPrimary: Color(0xFF426F91),
    lightText: Color(0xFF202B35),
    darkBackground: Color(0xFF121A22),
    darkSurface: Color(0xFF1E2934),
    darkPrimary: Color(0xFF91BCE0),
    darkText: Color(0xFFEDF3F8),
  ),
  ColorPaletteData(
    name: 'Mocha & Champagne',
    lightBackground: Color(0xFFF6F2EC),
    lightSurface: Color(0xFFFFFCF7),
    lightPrimary: Color(0xFF8A6248),
    lightText: Color(0xFF302820),
    darkBackground: Color(0xFF1D1916),
    darkSurface: Color(0xFF2B241F),
    darkPrimary: Color(0xFFD7AD8B),
    darkText: Color(0xFFF4EEE7),
  ),
  ColorPaletteData(
    name: 'Sage & Eucalyptus',
    lightBackground: Color(0xFFF1F5F1),
    lightSurface: Color(0xFFFFFFFF),
    lightPrimary: Color(0xFF547A66),
    lightText: Color(0xFF222C26),
    darkBackground: Color(0xFF141C18),
    darkSurface: Color(0xFF222D26),
    darkPrimary: Color(0xFFA2C8AE),
    darkText: Color(0xFFEDF3EE),
  ),
  ColorPaletteData(
    name: 'Amethyst & Lavender',
    lightBackground: Color(0xFFF5F2F8),
    lightSurface: Color(0xFFFFFFFF),
    lightPrimary: Color(0xFF725A91),
    lightText: Color(0xFF2B2533),
    darkBackground: Color(0xFF191620),
    darkSurface: Color(0xFF292432),
    darkPrimary: Color(0xFFC0A9DF),
    darkText: Color(0xFFF2EDF7),
  ),
];
