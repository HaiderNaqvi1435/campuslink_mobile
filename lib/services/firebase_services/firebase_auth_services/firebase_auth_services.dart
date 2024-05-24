import 'package:campuslink_mobile/data/models/user_data_model/teacher_data_model/teacher_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/user_data_model/student_data_model/student_data_model.dart';
import '../../../data/models/user_data_model/user_data_model.dart';
import '../../../utils/enums/enums.dart';

class FirebaseAuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static Future<void> signUp(UserDataModel user, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: password, // You should get this from the user input
      );

      user.userId = userCredential.user!.uid;
  // Send email verification
    await userCredential.user!.sendEmailVerification();
      // Check the role and save to the corresponding collection
      if (user.role == UserRole.teacher) {
        await _firestore
            .collection('teachers')
            .doc(user.userId)
            .set(user.toJson());
      } else if (user.role == UserRole.student) {
        await _firestore
            .collection('students')
            .doc(user.userId)
            .set(user.toJson());
      }

      // Handle post-sign-up logic
    } catch (e) {
      // Handle errors
      if (kDebugMode) {
        print(e);
      }
    }
  }
static Future<Map<String, dynamic>?> signIn({
    required String email,
    required String password,
    required bool isTeacher,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // User signed in successfully
      User? user = userCredential.user;

      if (user != null) {
        // Check if the email is verified
        if (!user.emailVerified) {
          return {'error': 'Email not verified'};
        }

        // Determine the collection based on the flag isTeacher
        String userRoleCollection = isTeacher ? 'teachers' : 'students';

        // Get the user data from the corresponding collection
        DocumentSnapshot userDataSnapshot =
            await _firestore.collection(userRoleCollection).doc(user.uid).get();

        if (!userDataSnapshot.exists) {
          return {'error': 'Incorrect role'};
        }

        // Convert the snapshot to UserDataModel
        if (userRoleCollection == 'teachers') {
          TeacherDataModel userData = TeacherDataModel.fromJson(
              userDataSnapshot.data() as Map<String, dynamic>);
          return {
            'userCredential': userCredential,
            'userData': userData,
          };
        } else {
          StudentDataModel userData = StudentDataModel.fromJson(
              userDataSnapshot.data() as Map<String, dynamic>);
          return {
            'userCredential': userCredential,
            'userData': userData,
          };
        }
      }
    } catch (e) {
      // Handle errors
      print(e);
      // Return null in case of an error
      return null;
    }
    // Return null if user is not signed in
    return null;
  }


   static Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw e; // Rethrow the error to handle it in the calling function
    }
  }
  // static Future<Map<String, dynamic>?> signIn({
  //   required String email,
  //   required String password,
  //   required bool isTeacher,
  // }) async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     // User signed in successfully
  //     User? user = userCredential.user;

  //     if (user != null) {
  //        if (!user.emailVerified) {
  //       await user.sendEmailVerification();
  //       return null;
  //     }
  //       // Determine the collection based on the flag isTeacher
  //       String userRoleCollection = isTeacher ? 'teachers' : 'students';

  //       // Get the user data from the corresponding collection
  //       DocumentSnapshot userDataSnapshot =
  //           await _firestore.collection(userRoleCollection).doc(user.uid).get();

  //       // Convert the snapshot to UserDataModel
  //       if (userRoleCollection == 'teachers') {
  //         TeacherDataModel userData = TeacherDataModel.fromJson(
  //             userDataSnapshot.data() as Map<String, dynamic>);
  //         return {
  //           'userCredential': userCredential,
  //           'userData': userData,
  //         };
  //       } else {
  //         StudentDataModel userData = StudentDataModel.fromJson(
  //             userDataSnapshot.data() as Map<String, dynamic>);
  //         return {
  //           'userCredential': userCredential,
  //           'userData': userData,
  //         };
  //       }

  //       // Return a map containing both UserCredential and UserDataModel
  //     }
  //   } catch (e) {
  //     // Handle errors
  //     print(e);
  //     // Return null in case of an error
  //     return null;
  //   }
  //   // Return null if user is not signed in
  //   return null;
  // }

  static Future<Map<String, dynamic>?> fetchUserData(
      String uid, bool isTeacher) async {
    try {
      String userRoleCollection = isTeacher ? 'teachers' : 'students';

      DocumentSnapshot userDataSnapshot =
          await _firestore.collection(userRoleCollection).doc(uid).get();

      Map<String, dynamic> userDataMap =
          userDataSnapshot.data() as Map<String, dynamic>;

   if (userRoleCollection == 'teachers') {
          TeacherDataModel userData = TeacherDataModel.fromJson(
            userDataMap);
          return {
            'role': "teacher",
            'userData': userData,
          };
        } else {
          StudentDataModel userData = StudentDataModel.fromJson(
             userDataMap);
          return {
            'role': "student",
            'userData': userData,
          };
        }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
