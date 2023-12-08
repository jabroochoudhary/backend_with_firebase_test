import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_activity/modules/splash/controller/splash_controller.dart';
import 'package:user_activity/utils/app_config.dart';
import 'package:user_activity/utils/app_theme/AppColors.dart';
import 'package:user_activity/utils/customs/app_text/app_text.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  final c = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: AppConfig(context).width),
          Image.asset(
            'assets/logo.png',
            width: AppConfig(context).width * 1,
          ),
          AppText.text(
            'User Activity',
            textAlignment: TextAlign.center,
            fontsize: 18,
            fontweight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ],
      ),
    ));
  }
}
