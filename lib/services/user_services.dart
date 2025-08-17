// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo/models/user_model.dart';
// import 'package:flutter/material.dart';

// class UserServices {
//   final CollectionReference userdetails = FirebaseFirestore.instance.collection(
//     "UserDetails",
//   );
//   Future<void> userdetailsed(UserModel usermodel) async {
//     try {
//       final Map<String, dynamic> data = usermodel.toJson();
//       final DocumentReference docref = await userdetails.add(data);

//       await docref.update({"id": docref.id});
//       //ScaffoldMessenger.of()

//       print("sucess user data added");
//     } catch (error) {
//       //  ScaffoldMessenger.of((context).)

//       print("Error page user sevices page @@@@@ @@@@@ @@@@@ @@@@@@");
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  final CollectionReference userdetails = FirebaseFirestore.instance.collection(
    "UserDetails",
  );
  Future<bool> userdetailsed(UserModel usermodel) async {
    try {
      final Map<String, dynamic> data = usermodel.toJson();
      final DocumentReference docref = await userdetails.add(data);
      await docref.update({"id": docref.id});
      print("Success user data added");
      return true; // Return success
    } catch (error) {
      print("Error in user services: $error");
      return false; // Return failure
    }
  }

  static Future<bool> checkUsername(String username) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Query to check if username exists
      QuerySnapshot querySnapshot = await firestore
          .collection("UserDetails")
          .where(
            "username",
            isEqualTo: username,
          ) // Assuming username field exists in your UserModel
          .get();

      // If documents exist, username is taken
      if (querySnapshot.docs.isNotEmpty) {
        print("Username '$username' already exists");
        return false; // Username is taken
      } else {
        print("Username '$username' is available");
        return true; // Username is available
      }
    } catch (error) {
      print("Error checking username: $error");
      return false; // Return false on error (assume taken for safety)
    }
  }
 

  
}
