import 'package:bloc_api_call/controller/user_controller.dart';
import 'package:get/get.dart';

class apicall extends Bindings {
  void dependencies() {
    Get.put(UserController());
  }
}
