import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar {
  static lightBarIcon() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // set status bar color to transparent
      statusBarBrightness: Brightness.dark, // set status bar brightness
      statusBarIconBrightness: Brightness.dark,
      // set status bar icon brightness
    ));
  }

  static darkBarIcon() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // set status bar color to transparent
      statusBarBrightness: Brightness.light, // set status bar brightness
      statusBarIconBrightness: Brightness.dark,

      // set status bar icon brightness
    ));
  }
}
