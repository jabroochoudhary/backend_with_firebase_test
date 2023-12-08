import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import '../../app_theme/AppColors.dart';
import '../app_text/app_text.dart';

class ToastMessage {
  static snackBar(
      {String message = "Message",
      bool isSucess = true,
      String label = "Success"}) {
    return Get.snackbar(
      label,
      message,
      messageText: AppText.text(
        message,
        fontsize: 12,
        maxlines: 2,
        textAlignment: TextAlign.left,
        fontweight: FontWeight.w400,
        color: AppColors.background,
        feildOverFlow: TextOverflow.ellipsis,
      ),
      animationDuration: Duration(milliseconds: 800),
      duration: Duration(milliseconds: 2500),
      backgroundColor: isSucess
          ? Color.fromARGB(255, 0, 125, 4)
          : const Color.fromARGB(255, 173, 60, 52),
      borderRadius: 12,
      colorText: AppColors.background,
      padding: EdgeInsets.all(12),
    );
  }

  static toast(
      {String message = "Message", Toast length = Toast.LENGTH_SHORT}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: length,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 239, 239, 239),
        textColor: Color.fromARGB(255, 221, 221, 221),
        fontSize: 18.0);
  }

  static showLoading() {
    return Get.dialog(
      Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          height: 70,
          width: 250,
          child: Scaffold(
            body: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.text(
                    "Loading...",
                    fontsize: 25,
                    fontweight: FontWeight.w500,
                    color: AppColors.primaryDark,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const CircularProgressIndicator(
                    color: AppColors.primaryDark,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static endLoading() {
    try {
      if (Get.isDialogOpen!) {
        Get.back();
      }
    } catch (e) {}
  }

  defaultYesNoDialouge(
    String title, {
    GestureTapCallback? onCancelPressed,
    GestureTapCallback? onConfirmPressed,
    String confirmText = "Delete",
  }) {
    return Get.defaultDialog(
      cancelTextColor: AppColors.primaryColor,
      confirmTextColor: Colors.red,
      backgroundColor: Colors.white,
      title: "Confirmation",
      titleStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
      middleTextStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.grey,
      ),
      middleText: title,
      cancel: InkWell(
        onTap: () {
          onCancelPressed!();
        },
        child: Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: AppText.text(
              "Cancel",
              color: AppColors.background,
            ),
          ),
        ),
      ),
      confirm: InkWell(
        onTap: () {
          onConfirmPressed!();
          // print("Confrim pressed");
        },
        child: Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: AppText.text(
              confirmText,
              color: AppColors.background,
            ),
          ),
        ),
      ),
    );
  }
}
