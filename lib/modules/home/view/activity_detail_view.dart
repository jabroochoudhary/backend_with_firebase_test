import 'package:advance_pdf_viewer2/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_activity/modules/home/controller/home_controller.dart';
import 'package:user_activity/modules/home/model/activity_model.dart';
import 'package:user_activity/utils/app_config.dart';
import 'package:user_activity/utils/app_theme/AppColors.dart';
import 'package:user_activity/utils/customs/app_button/app_button.dart';
import 'package:user_activity/utils/customs/app_text/app_text.dart';

// ignore: must_be_immutable
class ActivityDetailView extends StatelessWidget {
  ActivityModel data;
  ActivityDetailView({super.key, required this.data});

  final _controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                if (data.text.toString().isNotEmpty) ...{
                  AppText.text(
                    "Activity Name",
                    fontsize: 20,
                    fontweight: FontWeight.w600,
                    color: AppColors.primaryDark,
                  ),
                  const SizedBox(height: 10),
                  AppText.text(data.text.toString(),
                      fontsize: 17,
                      fontweight: FontWeight.w400,
                      color: AppColors.grey,
                      maxlines: 10),
                },
                const SizedBox(height: 25),
                if (data.images!.isNotEmpty) ...{
                  AppText.text(
                    "Images",
                    fontsize: 20,
                    fontweight: FontWeight.w600,
                    color: AppColors.primaryDark,
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...data.images!
                            .map((e) => Container(
                                  width: 120,
                                  height: 200,
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(e),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  )
                },
                const SizedBox(height: 20),
                if (data.pdf!.isNotEmpty) ...{
                  AppText.text(
                    "PDF",
                    fontsize: 20,
                    fontweight: FontWeight.w600,
                    color: AppColors.primaryDark,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: AppConfig(context).height * 0.35,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: data.pdf!.length,
                      itemBuilder: (BuildContext context, int index) {
                        // PDFDocument file = PDFDocument.fromURL(data.pdf![index]);
                        return FutureBuilder(
                          future: PDFDocument.fromURL(data.pdf![index]),
                          builder:
                              (context, AsyncSnapshot<PDFDocument?> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: AppText.text(
                                  'Error loading PDF',
                                  fontsize: 12,
                                  color: AppColors.grey,
                                ),
                              );
                            } else if (!snapshot.hasData ||
                                snapshot.data == null) {
                              return Center(
                                child: AppText.text(
                                  'No PDF data available',
                                  fontsize: 12,
                                  color: AppColors.grey,
                                ),
                              );
                            } else {
                              return Stack(
                                children: [
                                  Container(
                                    height: AppConfig(context).height * 0.35,
                                    width: 200,
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      width: 1,
                                      color: AppColors.primaryLight,
                                    )),
                                    child: PDFViewer(
                                      document: snapshot.data!,
                                      enableSwipeNavigation: false,
                                      showIndicator: false,
                                      showPicker: false,
                                      showNavigation: false,
                                    ),
                                  ),
                                  const Positioned(
                                      right: 10,
                                      bottom: 10,
                                      child: Icon(
                                        Icons.picture_as_pdf,
                                        color: Colors.red,
                                      ))
                                ],
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                },
                const SizedBox(height: 10),
                Appbutton().primaryButton(
                  context: context,
                  callback: () =>
                      _controller.deleteActivit(data.timestamp.toString()),
                  title: "Remove Activity",
                  isIcon: true,
                  // backGroundColor: Colors.red,
                  width: AppConfig(context).width,
                  icon: Icons.delete,
                  fontsize: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
