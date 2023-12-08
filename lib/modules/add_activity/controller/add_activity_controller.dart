import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:user_activity/modules/add_activity/service/add_activity_service.dart';
import 'package:user_activity/utils/customs/app_message/toast_message.dart';

class AddActivityController extends GetxController with AddActivityService {
  var textNameController = TextEditingController().obs;

  RxList<String> pickedImages = <String>[].obs;
  RxList<String> pickedPdfs = <String>[].obs;
  RxInt countUploaded = 0.obs;
  RxDouble progress = 0.0.obs;
  RxBool isLoading = false.obs;

  loadFilesFromDevice(int type) async {
    try {
      if (type == 1) {
        var result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: true,
          allowedExtensions: ['jpg', 'png'],
        );
        print(result);
        if (result != null) {
          for (var element in result.files) {
            pickedImages.add(element.path.toString());
          }
        }
      } else {
        var result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
          allowMultiple: true,
        );
        print(result);

        if (result != null) {
          for (var element in result.files) {
            pickedPdfs.add(element.path.toString());
          }
        }
      }
      Logger().d(pickedImages.length, error: pickedPdfs.length);
    } catch (e) {
      Logger().f(e);
    }
  }

  clearForm() {
    pickedImages.clear();
    pickedPdfs.clear();
    textNameController.value.text = "";
  }

  uploadData() async {
    if (pickedImages.isEmpty &&
        pickedPdfs.isEmpty &&
        textNameController.value.text.isEmpty) {
      ToastMessage.snackBar(
          isSucess: false,
          message: "PLease add some data to the form it should never be empty.",
          label: "Error");
    } else {
      isLoading.value = true;
      bool isSucess = await saveDataToFirebase(
          imagesList: pickedImages,
          text: textNameController.value.text,
          pdfList: pickedPdfs,
          progressCallback: (count) {
            countUploaded.value += count;
            int v = pickedImages.length + pickedPdfs.length;
            progress.value = (countUploaded.value / v);
            // Logger().d(progress.value);
          });

      if (isSucess) {
        clearForm();
        Get.back();
        isLoading.value = false;

        ToastMessage.snackBar(
            isSucess: true,
            message: "Data added successfully",
            label: "Success");
      } else {
        ToastMessage.snackBar(
            isSucess: false,
            message: "Something went wrong please try again.",
            label: "Error");
      }
    }
  }
}
