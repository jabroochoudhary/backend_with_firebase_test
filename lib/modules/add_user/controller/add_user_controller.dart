import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_activity/app_services/local_data_saver.dart';
import 'package:user_activity/modules/add_user/service/add_user_service.dart';
import 'package:user_activity/modules/home/view/home_view.dart';
import 'package:user_activity/utils/customs/app_message/toast_message.dart';

class AddUserController extends GetxController with AddUserService {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  addUser() async {
    var name = nameController.value.text;
    var email = emailController.value.text;
    if (name.isEmpty || email.isEmpty) {
      ToastMessage.snackBar(
          isSucess: false,
          message: "Please fill all the fields",
          label: "Error");

      return;
    }
    ToastMessage.showLoading();

    final data = {
      "name": name,
      "email": email,
      "created_at": DateTime.now().millisecondsSinceEpoch
    };
    final userId = await saveDataToFirebase(data);
    if (userId.isNotEmpty) {
      await AppLocalDataSaver.setString(userId, AppLocalDataSaver.userId);
      await AppLocalDataSaver.setString(email, AppLocalDataSaver.userEmail);
      await AppLocalDataSaver.setString(name, AppLocalDataSaver.userName);
      Get.offAll(() => HomeView());
    } else {
      ToastMessage.snackBar(
          isSucess: false,
          message: "Make sure you have internet access",
          label: "Error");
    }
    ToastMessage.endLoading();
  }
}
