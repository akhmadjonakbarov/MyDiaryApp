import 'package:image_picker/image_picker.dart';

class ImageSelector {
  static Future<String?> select() async {
    String? imagePath;
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath = image.path;
    }
    return imagePath;
  }
}
