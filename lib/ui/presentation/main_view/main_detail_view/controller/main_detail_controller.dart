import 'package:task_firebase/core/model/base_table.dart';
import 'package:task_firebase/core/model/field_name.dart';
import 'package:task_firebase/core/service/api.dart';
import 'package:task_firebase/core/service/singleton.dart';
import 'package:task_firebase/locator.dart';
import 'package:task_firebase/core/extension/extension.dart';

class MainDetailController {
  final Api _api = Api(BaseTable.posts);

  String? _title;
  String? _content;

  set title(String? value) {
    _title = value;
  }

  set content(String? value) {
    _content = value;
  }

  void updatePost(String postID) async {
    await _api.updateDocumentComplex(
        parentID: locator<Singleton>().userModel.id,
        childTable: BaseTable.userPosts,
        childID: postID,
        data: {
          FieldName.title: _title,
          FieldName.content: _content,
        }).then((value) => value.backOrNotification());
  }
}
