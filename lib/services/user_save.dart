import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'storage_services.dart';

class UserSave {
  Future<void> storeUserData(User user) async {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Define a reference to the user's document
    DocumentReference userRef = firestore.collection('users').doc(user.uid);

    // Check if the user already exists in Firestore
    bool userExists = (await userRef.get()).exists;

    // If the user doesn't exist, create a new document with user data
    if (!userExists) {
      await userRef.set({
        'uid': user.uid,
        'email': user.email,
        'yourPhotoUrl': user.photoURL,
      });
    }
  }

  Future<void> updateUserPersonalData(
      user, controllerOne, controllerTwo) async {
    if (user != null) {
      try {
        // Access Firestore instance
        FirebaseFirestore firestore = FirebaseFirestore.instance;

        // Reference to the user's document
        DocumentReference userRef =
            firestore.collection('users').doc(user!.uid);

        // Update the document with the new values
        await userRef.update({
          'YourName': controllerOne.text,
          'PartnerName': controllerTwo.text,
          // Add more fields as needed
        });

        // print('User data updated successfully!');
      } catch (e) {
        // print('Error updating user data: $e');
      }
    }
  }

  Future<void> updateUserWeddingData(
      user, selectedDateTime, locationController, budgetController) async {
    if (user != null) {
      try {
        // Access Firestore instance
        FirebaseFirestore firestore = FirebaseFirestore.instance;

        // Reference to the user's document
        DocumentReference userRef =
            firestore.collection('users').doc(user!.uid);

        // Update the document with the new values
        await userRef.update({
          'DateTime': selectedDateTime,
          'Location': locationController.text,
          'Budget': budgetController.text,
        });

        // print('User data updated successfully!');
      } catch (e) {
        // print('Error updating user data: $e');
      }
    }
  }

  Future<void> storageTimeCounterPhoto(user, file) async {
    if (user != null) {
      try {
        // Access Firestore instance
        FirebaseFirestore firestore = FirebaseFirestore.instance;

        // Reference to the user's document
        DocumentReference userRef =
            firestore.collection('users').doc(user!.uid);

        String timeCounterPhotoURL = await StorageMethods()
            .uploadImage(folderName: "TimeCounterPhotos", file: file);

        // Update the document with the new values
        await userRef.update({
          'timeCounterPhotoURL': timeCounterPhotoURL,
        });
        // print("Image stored successfully! $timeCounterPhotoURL");
      } catch (e) {
        // print('Error updating user data: $e');
      }
    }
  }

  //add a task to a category
  Future<void> addTask(user, categoryName, taskNameController,
      taskDescriptionController, taskCompleted) async {
    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    if (user != null) {
      try {
        await firestore
            .collection('planning')
            .doc(user!.uid)
            .collection(categoryName)
            .add({
          'taskName': taskNameController,
          'taskDescription': taskDescriptionController,
          'taskCompleted': taskCompleted,
        });
      } catch (e) {
        // print('Error adding task: $e');
      }
    }
  }

  //add a guest to a family
  Future<void> addGuest(user, familyName, guestNameController,
      guestNoteController, guestConfirmed) async {
    if (user != null) {
      try {
        // Access Firestore instance
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore
            .collection('guests')
            .doc(user!.uid)
            .collection(familyName)
            .add({
          'guestName': guestNameController,
          'guestNote': guestNoteController,
          'guestConfirmed': guestConfirmed,
        });
      } catch (e) {
        // print('Error adding task: $e');
      }
    }
  }

  //add a family
  Future<void> addFamily(user, familyName) async {
    if (user != null) {
      try {
        // Access Firestore instance
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore
            .collection('guests')
            .doc(user!.uid)
            .collection(familyName)
            .add({});
      } catch (e) {
        // print('Error adding task: $e');
      }
    }
  }
}
