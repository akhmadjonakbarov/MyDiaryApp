import 'package:get/get.dart';
import '../../entry/logic/entry_controller.dart';
import '../../profile/logic/profile_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.put(EntryController());
  }
}
