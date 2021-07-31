// toast
import 'package:another_flushbar/flushbar.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:flutter/material.dart';

class CustomFlushBar {
  //
  static void flushbar(String msg, context, {required bool isError}) {
    Flushbar(
      message: msg,
      flushbarPosition: FlushbarPosition.TOP,
      messageSize: 18.0,
      // backgroundColor: Colors.white,
      icon: Icon(
        isError ? Icons.info_outline : Icons.done,
        size: 28.0,
        color: isError ? Colors.red : Colors.green,
      ),
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: Style.primaryColor,
    )..show(context);
  }
}
