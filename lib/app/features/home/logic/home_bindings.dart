import 'package:get/get.dart';
import 'package:mydiary/app/features/profile/logic/profile_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
