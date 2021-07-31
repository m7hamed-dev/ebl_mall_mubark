import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Style {
  //
  static final Color scafoldBackground = HexColor("#faf6f1");
  static final HexColor primaryColor = HexColor('#f58936');
  static final Color heighOrang = HexColor('##f3953a');
  static final Color customGrey = HexColor('#c4c4c4');
  static final Color greyText = HexColor('#736b68');
  static final Color hintColor = HexColor('#b5b0b0');
  // font name
  static final String _fontFamily = 'pfd';
  //
  static ThemeData themeData() {
    //
    return ThemeData(
      primaryColor: primaryColor,
      primarySwatch: Colors.indigo,
      buttonColor: primaryColor,
      fontFamily: _fontFamily,
      cardColor: Colors.yellow,
      // app bar
      appBarTheme: AppBarTheme(
        // color: scafoldBackground,
        backgroundColor: HexColor('#f58936'),
        // backgroundColor: primaryColor,
        elevation: 0.0,
        centerTitle: true,
        // iconTheme: IconThemeData(),
      ),
      //
    );
  }

  // lables
  static TextStyle labelStyle({Color? color, double? fontSize}) {
    return TextStyle(
      fontSize: fontSize ?? 13.0,
      color: color ?? greyText,
      fontFamily: _fontFamily,
    );
  }

  static TextStyle hintStyle() {
    return TextStyle(
      fontSize: 11.0,
      color: hintColor,
      fontFamily: _fontFamily,
    );
  }

  static TextStyle bold(
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? 18.0,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontFamily: _fontFamily,
    );
  }

  static TextStyle medium({Color? color}) {
    return TextStyle(
      fontSize: 13.0,
      color: color ?? customGrey,
      fontFamily: _fontFamily,
    );
  }

  static TextStyle subTitle() {
    return TextStyle(
      fontSize: 13.0,
      color: primaryColor,
      fontFamily: _fontFamily,
    );
  }

  static TextStyle tiny(
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? 10.0,
      fontFamily: 'pfd',
      color: color ?? Colors.grey,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
  //
}
