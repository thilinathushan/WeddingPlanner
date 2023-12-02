import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_auth/firebase_auth.dart';

class StorageMethods {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> uploadImage({
    required String folderName,
    required File file,
  }) async {
    try {
      final extension = path.extension(file.path);
      final fileName = path.basenameWithoutExtension(file.path);
      // create a reference for the image here, including the filename
      Reference ref =
          firebaseStorage.ref().child(folderName).child('$fileName$extension');
      await ref.putFile(file);
      String timeCounterPhotoURL = await ref.getDownloadURL();
      // print("timeCPURL : $timeCounterPhotoURL");
      return timeCounterPhotoURL;
    } catch (e) {
      // print(e);
      return '';
    }
  }
}
