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
    tabBarTheme: const TabBarTheme(
      dividerHeight: 0.0,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Color(0xff1A1B1E),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF00629E),
            width: 2.0,
          ),
        ),
      ),
      labelColor: Color(0xff1A1B1E),
      unselectedLabelColor: Color(0xffC4C6CF),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF00629E),
      unselectedItemColor: const Color(0xff555F71).withOpacity(0.5),
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 0.0,
        height: 58.0,
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
            color: Color(0xff1A1B1E)))),
    bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12.0),
          ),
        ),
        backgroundColor: Colors.white,
        modalElevation: 0.0,
        modalBackgroundColor: Colors.white,
        elevation: 0.0),
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
      tabBarTheme: const TabBarTheme(
        dividerHeight: 0.0,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Color(0xffE3E2E6),
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFF00629E),
              width: 2.0,
            ),
          ),
        ),
        labelColor: Color(0xffE3E2E6),
        unselectedLabelColor: Color(0xff43474E),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: const Color(0xff1A1B1E),
        selectedItemColor: const Color(0xFF00629E),
        unselectedItemColor: const Color(0xffBDC7DC).withOpacity(0.5),
      ),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: const Color(0xff1A1B1E),
          elevation: 0.0,
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          labelTextStyle: MaterialStateProperty.all(const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              color: Color(0xffE3E2E6)))),
      bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12.0),
            ),
          ),
          backgroundColor: Color(0xff121317),
          elevation: 0.0),
      scaffoldBackgroundColor: const Color(0xff121317),
      colorScheme: AppColors.darkScheme);

  static final ThemeData _base =
      ThemeData(useMaterial3: true, fontFamily: FontFamily.roboto);
}
