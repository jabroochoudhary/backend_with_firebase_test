import 'package:flutter/material.dart';

import '../../app_config.dart';
import '../../app_theme/AppColors.dart';
import '../app_text/app_text.dart';

class Appbutton {
  primaryButton({
    required BuildContext context,
    String title = "",
    required Function callback,
    double height = 50,
    Color textColor = AppColors.background,
    double width = 50,
    bool isShadow = true,
    bool isIcon = false,
    IconData icon = Icons.send,
    double fontsize = 14,
    bool onlyIcon = false,
    double borderradius = 10,
    Color backGroundColor = AppColors.primaryDark,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(borderradius),
      color: backGroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderradius),
        onTap: () => {callback()},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderradius),
              boxShadow: isShadow
                  ? [
                      BoxShadow(
                        color: backGroundColor.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]
                  : [],
              border: Border.all(
                color: Colors.white,
                width: 0.5,
              )),
          height: height,
          width: width,
          child: onlyIcon
              ? Icon(
                  icon,
                  color: textColor,
                )
              : Center(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.text(
                      title,
                      fontsize: fontsize == 0
                          ? AppConfig(context).width / 30
                          : fontsize,
                      fontweight: FontWeight.w700,
                      color: textColor,
                    ),
                    if (isIcon) ...{
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        icon,
                        color: textColor,
                      ),
                    }
                  ],
                )),
        ),
      ),
    );
  }
}
