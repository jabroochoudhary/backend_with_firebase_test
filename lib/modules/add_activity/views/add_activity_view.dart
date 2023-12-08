import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_activity/modules/add_activity/controller/add_activity_controller.dart';
import 'package:user_activity/utils/app_theme/AppColors.dart';
import '/modules/add_activity/components/add_activity_components.dart';
import '/utils/app_config.dart';
import '/utils/customs/app_text/app_text.dart';
import '/utils/customs/textfeilds.dart';
import '../../../utils/customs/app_button/app_button.dart';

class AddActivityView extends StatelessWidget {
  AddActivityView({super.key});
  final _controller = Get.put(AddActivityController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: AppText.text(
            'Add New Activity',
            fontsize: 22,
            fontweight: FontWeight.w600,
          ),
          actions: [
            InkWell(
              onTap: () => _controller.clearForm(),
              child: Icon(Icons.clear),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                AppTextFormFiled(
                  lines: 4,
                  // textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  hintText: "Activity Name (optional)",
                  cntr: _controller.textNameController.value,
                ),
                AddActivityComponenets.customerConatiner(context,
                    description:
                        "No images are selected \nTap here to add images\n(optional)",
                    files: _controller.pickedImages,
                    type: 1,
                    label: "Images", onPressed: () {
                  _controller.loadFilesFromDevice(1);
                }),
                AddActivityComponenets.customerConatiner(
                  context,
                  description:
                      "No PDFs are selected \nTap here to add PDFs\n(optional)",
                  label: "PDFs",
                  onPressed: () {
                    _controller.loadFilesFromDevice(2);
                  },
                  files: _controller.pickedPdfs,
                  type: 2,
                ),
                const SizedBox(height: 20),
                _controller.isLoading.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText.text(
                            "Saving",
                            fontsize: 25,
                            fontweight: FontWeight.w600,
                            color: AppColors.primaryDark,
                          ),
                          SizedBox(
                            width: AppConfig(context).width * 0.60,
                            height: AppConfig(context).height * 0.02,
                            child: LinearProgressIndicator(
                              value: _controller.progress.value,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      )
                    : Appbutton().primaryButton(
                        context: context,
                        callback: () => _controller.uploadData(),
                        title: "Save Activity",
                        width: AppConfig(context).width,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
