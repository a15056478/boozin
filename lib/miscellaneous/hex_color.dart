import 'dart:ui';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class HexColors {
  static String lightGrey = '#F0F0F0';
  static String darkGrey = '#323232';

  static String textBlack = '#000000';
  static String textWhite = '#FFFFFF';

  static String indicatorBackgroundLightMode = '#C4C4C4';
  static String indicatorBackgroundDarkMode = '#8A8A8A';

  static String indicatorHighlightLightMode = '#000000';
  static String indicatorHighlightDarkMode = '#FFFFFF';
}
