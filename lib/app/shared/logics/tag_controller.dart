import 'package:get/get.dart';
import 'package:mydiary/app/core/storage/sql_database_manager.dart';
import 'package:mydiary/app/shared/models/tag.dart';

import '../../core/data/constants_data.dart';
import '../../utils/error_handler.dart';

class TagController extends GetxController {
  var tags = <Tag>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTags();
  }

  final SQLDatabaseManager sqlDatabaseManager = SQLDatabaseManager();

  saveTag(Tag tag) async {
    try {
      await sqlDatabaseManager.insertTag(tag);
    } catch (e) {
      ErrorHandler.show(e.toString());
    } finally {
      getTags();
    }
  }

  deleteTags() async {
    try {
      await sqlDatabaseManager.deleteTags();
    } catch (e) {
      ErrorHandler.show(e.toString());
    } finally {
      getTags();
    }
  }

  getTags() async {
    try {
      final mappedTagList = await sqlDatabaseManager.getTags();
      for (var i in mappedTagList) {
        tags.add(Tag.fromMap(i));
      }
      for (var i in entriesTag) {
        tags.add(Tag(value: i));
      }
    } catch (e) {
      ErrorHandler.show(e.toString());
    }
  }
}
