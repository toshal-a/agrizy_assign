import 'package:flutter/material.dart';
import 'package:tapinvest_assign/utils/colors.dart';
import 'package:tapinvest_assign/utils/typescale.dart';

final appTheme = ThemeData(
    useMaterial3: false,
    // indicatorColor: ,
    primaryTextTheme: TextTheme(
        displaySmall: Typescale.bold20(),
        displayMedium: Typescale.bold18()
    ),
    iconTheme: const IconThemeData(
        color: Colors.white
    ),
    // buttonTheme: const ButtonThemeData(
    //     buttonColor: Colors.black, textTheme: ButtonTextTheme.normal),
    appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: ColorPalette.green700, //change your color here
    )),
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //     foregroundColor: Colors.white,
    // ),
    fontFamily: 'Inter',
    scaffoldBackgroundColor: ColorPalette.backGroundColor,
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: ColorPalette.customGreen,
        errorColor: ColorPalette.amber700,
        backgroundColor: ColorPalette.backGroundColor,
        brightness: Brightness.light
    ).copyWith(onPrimary: Colors.white),
);

