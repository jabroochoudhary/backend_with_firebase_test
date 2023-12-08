import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../../app_theme/AppColors.dart';

// import 'color.dart';

class AppText {
  AppText._();
  static nameText(
    text, {
    textAlignment = TextAlign.center,
    color = AppColors.black,
    double fontsize = 16.0,
    feildOverFlow = TextOverflow.ellipsis,
    maxlines,
    FontWeight fontweight = FontWeight.w500,
    double height = 1.2,
  }) {
    return Text(
      text.toString(),
      textAlign: textAlignment,
      overflow: feildOverFlow,
      maxLines: maxlines,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        height: height,
        fontWeight: fontweight,
      ),
    );
  }

  static text(
    text, {
    textAlignment = TextAlign.center,
    color = AppColors.black,
    double fontsize = 16.0,
    feildOverFlow = TextOverflow.ellipsis,
    maxlines,
    FontWeight fontweight = FontWeight.w500,
    double height = 1.2,
    bool isShadow = false,
  }) {
    return Text(
      text.toString(),
      textAlign: textAlignment,
      overflow: feildOverFlow,
      maxLines: maxlines,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        height: height,
        fontWeight: fontweight,
        shadows: isShadow
            ? [
                Shadow(
                  color: AppColors.black.withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(-2, 5),
                ),
              ]
            : [],
      ),
    );
  }

  pageTitle({
    @required text,
    textAlignment = TextAlign.center,
    color = AppColors.black,
    double fontsize = 18.0,
    feildOverFlow = TextOverflow.ellipsis,
    maxlines,
    FontWeight fontweight = FontWeight.w600,
  }) {
    return Text(
      text.toString(),
      textAlign: textAlignment,
      overflow: feildOverFlow,
      maxLines: maxlines,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontweight,
      ),
    );
  }
}
