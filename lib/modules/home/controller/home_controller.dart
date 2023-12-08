import 'package:get/get.dart';
import 'package:user_activity/app_services/local_data_saver.dart';
import 'package:user_activity/modules/home/services/home_service.dart';
import 'package:user_activity/utils/customs/app_message/toast_message.dart';

import '../model/activity_model.dart';

class HomeController extends GetxController with HomeService {
  RxString userId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  loadUserData() async {
    userId.value =
        (await AppLocalDataSaver.getString(AppLocalDataSaver.userId))!;
    loadActivities(userId.value);
  }

  final RxList<ActivityModel> modelData = <ActivityModel>[].obs;
  loadActivities(String userId) async {
    await fetchDataFromFirestore(userId, (updatedModelData) {
      modelData.assignAll(updatedModelData);
    });
  }

  deleteActivit(String docId) async {
    ToastMessage.showLoading();
    bool isSucess = await deleteActivityDoc(userId.value, docId);
    ToastMessage.endLoading();

    if (isSucess) {
      ToastMessage.toast(
        message: "Activity Deleted Successfully",
      );
      Get.back();
    } else {
      ToastMessage.toast(
        message: "Something went wrong",
      );
    }
  }
}
