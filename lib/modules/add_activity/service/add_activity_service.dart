import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:logger/logger.dart';
import 'package:user_activity/app_constants/app_constants.dart';
import 'package:path/path.dart';
import 'package:user_activity/app_services/local_data_saver.dart';

mixin AddActivityService {
  final _firebaseInstance =
      FirebaseFirestore.instance.collection(AppConstants.userCollectionName);
  final _firebaseStorageInstance =
      storage.FirebaseStorage.instance.ref().child("User_Activity");

  Future<bool> saveDataToFirebase(
      {List<String>? imagesList,
      List<String>? pdfList,
      String? text,
      Function(int)? progressCallback}) async {
    bool isSucessful = false;
    final userId =
        (await AppLocalDataSaver.getString(AppLocalDataSaver.userId))!;
    var imgUrls = <String>[];
    var pdfUrls = <String>[];

    if (imagesList != null && imagesList.isNotEmpty) {
      imgUrls = await _uploadFiles(imagesList, 1, (p) {
        try {
          progressCallback!(p);
        } catch (e) {}
      });
    }
    if (pdfList != null && pdfList.isNotEmpty) {
      pdfUrls = await _uploadFiles(pdfList, 2, (p) {
        try {
          progressCallback!(p);
        } catch (e) {}
      });
    }
    try {
      await _firebaseInstance
          .doc(userId)
          .collection(AppConstants.userActivityCollectionName)
          .add({
        "images": imgUrls,
        "pdf": pdfUrls,
        "text": text,
        "timestamp": DateTime.now().millisecondsSinceEpoch,
      }).then((value) {
        isSucessful = true;
      });
      isSucessful = true;
    } catch (e) {
      isSucessful = false;
    }
    return isSucessful;
  }

  Future<List<String>> _uploadFiles(
      List<String> paths, int type, Function(int) progressCallback) async {
    try {
      List<String> downloadUrls = [];

      for (String filePath in paths) {
        File file = File(filePath);
        String fileName = DateTime.now().microsecondsSinceEpoch.toString() +
            basename(file.path);

        storage.Reference storageReference = type == 1
            ? _firebaseStorageInstance.child('images/$fileName')
            : _firebaseStorageInstance.child('pdfs/$fileName');

        storage.UploadTask uploadTask = storageReference.putFile(file);

        await uploadTask.whenComplete(() async {
          String downloadUrl = await storageReference.getDownloadURL();
          downloadUrls.add(downloadUrl);
          progressCallback(1);
          // print('File uploaded successfully. Download URL: $downloadUrl');
        });
      }

      // Logger().d(downloadUrls, error: downloadUrls.length);

      return downloadUrls;
    } catch (e) {
      Logger().d('Error uploading files: $e');
      return [];
    }
  }
}
