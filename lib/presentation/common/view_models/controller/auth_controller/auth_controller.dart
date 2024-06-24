// ignore_for_file: use_build_context_synchronously

import 'package:campuslink_mobile/data/models/user_data_model/student_data_model/student_data_model.dart';
import 'package:campuslink_mobile/data/models/user_data_model/teacher_data_model/teacher_data_model.dart';
import 'package:campuslink_mobile/data/models/user_data_model/user_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../res/routes/routes_name.dart';
import '../../../../../services/firebase_services/firebase_auth_services/firebase_auth_services.dart';
import '../../../../../utils/utils.dart';

class AuthController extends GetxController {
  final RxBool isTeacher = false.obs;
  final RxBool obscureText = true.obs;
  final RxBool isLoading = false.obs;
  // late UserCredential userCredential;
  Rx<TeacherDataModel> teacherData = TeacherDataModel().obs;
  Rx<StudentDataModel> studentData = StudentDataModel().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  void checkLoginSession() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      // User is signed in
      Map<String, dynamic>? result;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isTeacher = prefs.getBool('isTeacher') ?? false;
      result = await FirebaseAuthServices.fetchUserData(
          FirebaseAuth.instance.currentUser!.uid, isTeacher);
      if (result != null) {
        if (isTeacher) {
          teacherData.value = result['userData'];
          studentData.value = StudentDataModel();
        } else {
          studentData.value = result['userData'];
          teacherData.value = TeacherDataModel();
        }
      }

    WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offNamed(RouteName.dashboardView);
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offNamed(RouteName.initialLoginView);
      });
      // No user is signed in
    }
  }

  // void startBlockCheck() async {
  //   blockCheckTimer?.cancel();
  //   blockCheckTimer =
  //       Timer.periodic(const Duration(seconds: 30), (timer) async {
  //     print(timer);
  //     print("Time is running");
  //     User? currentUser = FirebaseAuth.instance.currentUser;
  //     if (currentUser != null) {
  //       final SharedPreferences prefs = await SharedPreferences.getInstance();

  //       bool? isTeacher = prefs.getBool('isTeacher');
  //       // Fetch the user data again to check the block status
  //       UserDataModel? userData = await FirebaseAuthServices.fetchUserData(
  //           currentUser.uid, isTeacher!);
  //       if (userData != null && userData.isBlocked!) {
  //         Utils.showSnackBar(Get.context!,
  //             'Your account is blocked. Please contact the admin or HOD.');
  //         signOut();
  //         blockCheckTimer?.cancel();
  //       }
  //     } else {
  //       blockCheckTimer?.cancel();
  //     }
  //   });
  // }

  void login(BuildContext context) async {
    Map<String, dynamic>? result;
    String message;
    UserDataModel? userData;

    try {
      isLoading(true);

      result = await FirebaseAuthServices.signIn(
        email: emailController.value.text,
        password: passwordController.value.text,
        isTeacher: isTeacher.value,
      );

      if (result != null) {
        if (result.containsKey('error')) {
          String error = result['error'];
          if (error == 'Email not verified') {
            message = 'Please verify your email to continue.';
          } else if (error == 'Incorrect role') {
            message = 'Incorrect role. Please log in with the correct role.';
          } else {
            message = 'Login failed. Please try again.';
          }
          await FirebaseAuth.instance.signOut();

          Utils.showSnackBar(context, message);
          isLoading(false);

          return;
        }

        if (isTeacher.isTrue) {
          teacherData.value = result['userData'];
          userData = teacherData.value;
          studentData.value = StudentDataModel();
        } else {
          studentData.value = result['userData'];
          userData = studentData.value;
          teacherData.value = TeacherDataModel();
        }

        // Check if user is blocked
        if (userData.isBlocked!) {
          message = 'Your account is blocked. Please contact the admin or HOD.';
          Utils.showSnackBar(context, message);
          await FirebaseAuth.instance.signOut();

          isLoading(false);

          return; // Prevent further actions
        }

        message = 'Login Successfully';
        emailController.value.clear();
        passwordController.value.clear();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isTeacher', isTeacher.value);
        isLoading(false);

        await Get.offNamed(RouteName.dashboardView);
      } else {
        isLoading(false);

        message = 'Check your email or password';
      }
      Utils.showSnackBar(context, message);
    } catch (e) {
      isLoading(false);

      message = 'Error: $e';
      Utils.showSnackBar(context, message);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Clear stored preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('isTeacher');
      teacherData.value = TeacherDataModel();
      studentData.value = StudentDataModel();
      // Clear controller states
      emailController.value.clear();
      passwordController.value.clear();
      // Delay navigation to ensure widget tree stability
      Future.delayed(const Duration(milliseconds: 100), () async {
        if (Get.context != null && Get.isOverlaysOpen == false) {
          // Navigate to initial login view
          await Get.offAllNamed(RouteName.initialLoginView);

          // Show a snackbar message
          Utils.showSnackBar(Get.context!, 'You have been signed out.');
        }
      });
    } catch (e) {
      // Handle errors if any
      print('Error during sign out: $e');
      if (Get.context != null) {
        Utils.showSnackBar(
            Get.context!, 'Error during sign out. Please try again.');
      }
    }
  }

//old signout
  // void signOut() async {
  //   try {
  //     // Sign out from Firebase
  //     await FirebaseAuth.instance.signOut();

  //     // Clear stored preferences
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.remove('isTeacher');

  //     // Navigate to initial login view
  //     WidgetsBinding.instance.addPostFrameCallback((_) async {
  //       await Get.offNamed(RouteName.initialLoginView);

  //     });

  //     // Show a snackbar message
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       Utils.showSnackBar(Get.context!, 'You have been signed out.');
  //     });
  //   } catch (e) {
  //     // Handle errors if any
  //     print('Error during sign out: $e');
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       Utils.showSnackBar(
  //           Get.context!, 'Error during sign out. Please try again.');
  //     });
  //   }
  // }
}
