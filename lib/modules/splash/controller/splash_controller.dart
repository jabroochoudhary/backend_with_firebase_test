import 'package:get/get.dart';
import 'package:user_activity/app_services/local_data_saver.dart';
import 'package:user_activity/modules/add_user/views/add_user_view.dart';
import 'package:user_activity/modules/home/view/home_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkUser();
    super.onInit();
  }

  checkUser() async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      final user =
          (await AppLocalDataSaver.getString(AppLocalDataSaver.userId))!;
      if (user.isEmpty) {
        Get.offAll(() => AddUserView());
      } else {
        Get.offAll(() => HomeView());
      }
    } catch (e) {
      Get.offAll(() => AddUserView());
    }
  }
}
