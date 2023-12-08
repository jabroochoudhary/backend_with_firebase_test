import 'package:user_activity/modules/home/model/activity_model.dart';

import '../../../app_constants/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

mixin HomeService {
  fetchDataFromFirestore(
      String userId, Function(List<ActivityModel>) onDataFetched) {
    List<ActivityModel> modelData = <ActivityModel>[];
    FirebaseFirestore.instance
        .collection(AppConstants.userCollectionName)
        .doc(userId)
        .collection(AppConstants.userActivityCollectionName)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      modelData = snapshot.docs
          .map((doc) =>
              ActivityModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      modelData.sort((a, b) => b.timestamp!.compareTo(a.timestamp!));
      onDataFetched(modelData);
    });
  }
}
