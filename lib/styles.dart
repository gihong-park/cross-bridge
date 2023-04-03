import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  disabledColor: Color(0xFF5F5F66),
  colorScheme: const ColorScheme(
    tertiary: Color(0xFF5F5F66),
    primary: Color(0xfff3af20),
    brightness: Brightness.dark,
    onPrimary: Colors.black,
    secondary: Colors.black,
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFF8F8F8F),
    onSecondaryContainer: Colors.black,
    error: Color(0xFFF90912),
    onError: Colors.black,
    background: Color(0xFF1A191E),
    onBackground: Colors.white,
    surface: Color(0xFF202327),
    onSurface: Colors.white,
  ),
  appBarTheme: AppBarTheme(color: Color(0xFF202327), scrolledUnderElevation: 0),
  textTheme: GoogleFonts.aBeeZeeTextTheme(),
  fontFamily: GoogleFonts.aBeeZee().fontFamily,
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF8F8F8F), width: 1.0),
    ),
    labelStyle: TextStyle(color: Color(0xFF8F8F8F)),
    floatingLabelStyle: TextStyle(color: Color(0xfff3af20)),
  ),
);

ThemeData themeData = ThemeData(
  useMaterial3: true,
  // primarySwatch: createMaterialColor(Colors.white),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(backgroundColor: Colors.black),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.black,
    textTheme: ButtonTextTheme.primary,
  ),
  colorScheme: ColorScheme.fromSwatch(
      primarySwatch: createMaterialColor(Colors.white),
      backgroundColor: const Color.fromARGB(255, 250, 250, 250)),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.notoSans(fontSize: 26, fontWeight: FontWeight.w900),
    titleMedium:
        GoogleFonts.notoSans(fontSize: 24, fontWeight: FontWeight.w700),
    titleSmall: GoogleFonts.notoSans(fontSize: 22, fontWeight: FontWeight.w700),
    bodyLarge: GoogleFonts.notoSans(fontSize: 20),
    bodyMedium: GoogleFonts.notoSans(fontSize: 18),
    bodySmall: GoogleFonts.notoSans(fontSize: 16),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.0)),
    floatingLabelStyle: TextStyle(color: Colors.grey),
  ),
);

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
