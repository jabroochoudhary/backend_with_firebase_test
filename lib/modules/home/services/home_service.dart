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

  deleteActivityDoc(String userId, String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.userCollectionName)
          .doc(userId)
          .collection(AppConstants.userActivityCollectionName)
          .doc(docId)
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Best approach is to delete the files also from the storage
  /// We can delete the files using the referencing url of each file
  /// So i did't write the code beacue it takes a long time to delete the all files
  /// The best solution is to write the clud function to do this and the hit the function
  /// In free resources cloud function functionality not available
}
