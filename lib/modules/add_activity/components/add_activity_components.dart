import 'dart:io';

import 'package:flutter/material.dart';

import '../../../utils/app_config.dart';
import '../../../utils/app_theme/AppColors.dart';
import '../../../utils/customs/app_text/app_text.dart';

class AddActivityComponenets {
  static customerConatiner(
    BuildContext context, {
    String label = "Add Images",
    GestureTapCallback? onPressed,
    String description = "",
    List<String>? files,
    int type = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        AppText.text(
          label,
          fontsize: 17,
          fontweight: FontWeight.w400,
          color: AppColors.primaryDark,
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: onPressed,
          child: Container(
            height: AppConfig(context).height * 0.15,
            padding: const EdgeInsets.all(5),
            // width: AppConfig(context).width * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.background,
              border: Border.all(
                color: AppColors.grey,
                width: 1,
              ),
            ),
            child: Center(
              child: files != null && files.isNotEmpty
                  ? type == 1
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 20),
                          itemCount: files.length,
                          itemBuilder: (context, item) {
                            return Container(
                              padding: const EdgeInsets.all(8.0),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                image: DecorationImage(
                                    image: FileImage(
                                      File(files[item]),
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            );
                          })
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            for (int i = 0; i < files.length; i++) ...{
                              Positioned(
                                left: i * 22,
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: AppColors.background,
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          width: 1,
                                          color: AppColors.primaryDark,
                                        )),
                                    child: const Icon(
                                      Icons.picture_as_pdf,
                                      color: Colors.red,
                                    )),
                              ),
                            }
                          ],
                        )
                  : AppText.text(
                      description,
                      color: AppColors.grey.withOpacity(0.5),
                      fontsize: 15,
                      fontweight: FontWeight.w300,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
