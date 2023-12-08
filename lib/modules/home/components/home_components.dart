import 'package:flutter/material.dart';
import 'package:user_activity/modules/home/model/activity_model.dart';

import '../../../utils/app_config.dart';
import '../../../utils/app_theme/AppColors.dart';
import '../../../utils/customs/app_text/app_text.dart';

class HomeComponents {
  static homeMailCard(BuildContext context, ActivityModel dt) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: AppConfig(context).width,
      decoration: BoxDecoration(
        color: AppColors.primaryLight.withOpacity(0.04),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryLight, width: 1),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.text("Text",
                fontsize: 18,
                fontweight: FontWeight.w600,
                color: AppColors.primaryDark),
            AppText.text(
              dt.text!.isEmpty ? "Null" : dt.text,
              fontsize: 18,
              fontweight: FontWeight.w600,
              color: dt.text!.isEmpty ? Colors.red : AppColors.primaryDark,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.text("No of Images",
                fontsize: 18,
                fontweight: FontWeight.w600,
                color: AppColors.primaryDark),
            AppText.text(dt.images!.length.toString(),
                fontsize: 18,
                fontweight: FontWeight.w600,
                color: AppColors.primaryDark),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.text("No of PDF files",
                fontsize: 18,
                fontweight: FontWeight.w600,
                color: AppColors.primaryDark),
            AppText.text(dt.pdf!.length.toString(),
                fontsize: 18,
                fontweight: FontWeight.w600,
                color: AppColors.primaryDark),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.text("Created AT",
                fontsize: 18,
                fontweight: FontWeight.w600,
                color: AppColors.primaryDark),
            AppText.text(formatDate(dt.timestamp!),
                fontsize: 18,
                fontweight: FontWeight.w600,
                color: AppColors.primaryDark),
          ],
        )
      ]),
    );
  }

  static formatDate(int milliseconds) {
    var date = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}:${date.second}";
  }
}
