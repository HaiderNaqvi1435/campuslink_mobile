import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/models/user_data_model/user_data_model.dart';
import '../../../../services/firebase_services/firebase_auth_services/firebase_auth_services.dart';
import '../controller/auth_controller/auth_controller.dart';

class DashboardViewModel extends GetxController {
 
  final ac = Get.find<AuthController>();
  Timer? blockCheckTimer;

  @override
  void onInit() {
    super.onInit();
    // Initialize the Timer for checking if user is blocked
    blockCheckTimer = Timer.periodic(
      const Duration(seconds: 30), // Changed to seconds for testing purposes
      (_) => checkIfUserBlocked(),
    );
    print('Timer initialized');
  }

  @override
  void onClose() {
    blockCheckTimer?.cancel();
    print('Timer canceled');
    super.onClose();
  }

  void checkIfUserBlocked() async {
    print("checkIfUserBlocked is running");

    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      print("User is logged in, checking block status");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isTeacher = prefs.getBool('isTeacher') ?? false;
      UserDataModel? userData;
      Map<String, dynamic>? result =
          await FirebaseAuthServices.fetchUserData(currentUser.uid, isTeacher);
      if (result != null) {
        userData = result['userData'];
        userData = result['userData'];
      }
      if (userData != null && userData.isBlocked!) {
        print("User is blocked, signing out");
        ac.signOut();
      } else {
        print("User is not blocked");
      }
    } else {
      print("No user is logged in");
    }
  }
}
