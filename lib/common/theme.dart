import 'dart:io';

import 'package:downloader_handler_flutter/common/colors.dart';
import 'package:downloader_handler_flutter/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData light = _base.copyWith(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        elevation: 0.0,
        scrolledUnderElevation: Platform.isIOS ? 0.1 : 0.0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        )),
    dividerTheme:
        const DividerThemeData(thickness: 0.8, color: Color(0xfff5f6f8)),
    scaffoldBackgroundColor: const Color(0x0fffffff),
    colorScheme: AppColors.lightScheme,
  );

  static ThemeData dark = _base.copyWith(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
          elevation: 0.0,
          scrolledUnderElevation: Platform.isIOS ? 0.1 : 0.0,
          backgroundColor: const Color(0xff121317),
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Color(0xff1A1B1E),
            systemNavigationBarDividerColor: Color(0xff1A1B1E),
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: Color(0xff121317),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          )),
      dividerTheme:
          const DividerThemeData(thickness: 0.8, color: Color(0xff22252A)),
      scaffoldBackgroundColor: const Color(0xff121317),
      colorScheme: AppColors.darkScheme);

  static final ThemeData _base =
      ThemeData(useMaterial3: true, fontFamily: FontFamily.roboto);
}
