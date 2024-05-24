import 'package:get/get.dart';

import '../../../../../utils/input_controllers/user_input/user_input.dart';

abstract class SignUpController{


    UserInput controller = UserInput();
  final RxBool isLoading = false.obs;
  final RxBool obscureText = true.obs;
}