import 'package:get/get.dart';

import '../../../core/storage/shared_prefs_helper.dart';
import '../models/profile.dart';

class ProfileController extends GetxController {
  var profile = Profile.empty().obs;

  SharedPrefsHelper sharedPrefsHelper = Get.find<SharedPrefsHelper>();

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  void getProfile() {
    String fullName =
        sharedPrefsHelper.getString(SharedPreferencesKeys.fullName.name) ?? "";
    String? imagePath =
        sharedPrefsHelper.getString(SharedPreferencesKeys.imagePath.name);
    String status =
        sharedPrefsHelper.getString(SharedPreferencesKeys.status.name) ?? "";
    String about =
        sharedPrefsHelper.getString(SharedPreferencesKeys.about.name) ?? "";

    profile.value = Profile(
      fullName: fullName,
      imagePath: imagePath,
      status: status,
      about: about,
    );
  }

  void setProfile(String key, var value) {
    switch (key) {
      case 'fullName':
        sharedPrefsHelper.setString(key, value);
        break;
      case 'imagePath':
        sharedPrefsHelper.setString(key, value);
        break;
      case 'status':
        sharedPrefsHelper.setString(key, value);
        break;
      case 'about':
        sharedPrefsHelper.setString(key, value);
        break;
      default:
        throw ArgumentError('Invalid profile key: $key');
    }
    getProfile();
  }
}
