import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_activity/modules/add_user/controller/add_user_controller.dart';
import 'package:user_activity/utils/app_config.dart';
import 'package:user_activity/utils/app_theme/AppColors.dart';
import 'package:user_activity/utils/customs/app_button/app_button.dart';
import 'package:user_activity/utils/customs/app_text/app_text.dart';
import 'package:user_activity/utils/customs/textfeilds.dart';

class AddUserView extends StatelessWidget {
  AddUserView({super.key});

  final _controller = Get.put(AddUserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppConfig(context).height * 0.05),
              AppText.text(
                "ADD USER",
                fontsize: 25,
                fontweight: FontWeight.w600,
                color: AppColors.primaryLight,
              ),
              SizedBox(height: AppConfig(context).height * 0.10),
              AppTextFormFiled(
                hintText: "Full Name",
                cntr: _controller.nameController,
              ),
              const SizedBox(height: 20),
              AppTextFormFiled(
                hintText: "E-mail",
                cntr: _controller.emailController,
              ),
              const SizedBox(height: 20),
              Appbutton().primaryButton(
                context: context,
                title: "ADD",
                callback: () => _controller.addUser(),
                width: AppConfig(context).width,
                height: 50,
                borderradius: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
