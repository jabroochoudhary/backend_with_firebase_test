import 'package:get/get.dart';
import 'package:user_activity/app_services/local_data_saver.dart';
import 'package:user_activity/modules/home/services/home_service.dart';

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
}
