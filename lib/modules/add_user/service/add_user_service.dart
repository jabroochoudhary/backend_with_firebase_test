import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:user_activity/app_constants/app_constants.dart';

mixin AddUserService {
  final _firebase =
      FirebaseFirestore.instance.collection(AppConstants.userCollectionName);

  Future<String> saveDataToFirebase(Map<String, dynamic> data) async {
    var userId = "";
    try {
      await _firebase.add(data).then((value) {
        userId = value.id;
      }).timeout(const Duration(seconds: 7), onTimeout: () {
        throw "Timed out while saving";
      });
    } catch (e) {
      userId = "";
      Logger().d(e);
    }
    return userId;
  }
}
