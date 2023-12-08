import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_activity/modules/add_activity/views/add_activity_view.dart';
import 'package:user_activity/modules/home/components/home_components.dart';
import 'package:user_activity/modules/home/controller/home_controller.dart';
import 'package:user_activity/modules/home/view/activity_detail_view.dart';
import 'package:user_activity/utils/app_theme/AppColors.dart';

import 'package:user_activity/utils/customs/app_button/app_button.dart';
import 'package:user_activity/utils/customs/app_text/app_text.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: AppText.text(
              "Activities",
              fontsize: 22,
              fontweight: FontWeight.w600,
              color: AppColors.primaryDark,
            ),
            actions: [
              Appbutton().primaryButton(
                  context: context,
                  onlyIcon: true,
                  callback: () => Get.to(() => AddActivityView()),
                  isIcon: true,
                  isShadow: false,
                  icon: Icons.add,
                  borderradius: 45),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: _controller.userId.value.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _controller.modelData.isEmpty
                      ? Center(
                          child: AppText.text("No data available",
                              color: AppColors.grey),
                        )
                      : ListView.builder(
                          itemCount: _controller.modelData.length,
                          itemBuilder: (BuildContext context, int index) {
                            final dt = _controller.modelData[index];
                            return HomeComponents.homeMailCard(
                                context,
                                dt,
                                () =>
                                    Get.to(() => ActivityDetailView(data: dt)));
                          },
                        ),
            ),
          ),
        ));
  }
}
