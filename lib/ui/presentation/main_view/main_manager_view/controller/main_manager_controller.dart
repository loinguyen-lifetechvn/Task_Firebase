import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_firebase/core/model/base_table.dart';
import 'package:task_firebase/core/model/post_model.dart';
import 'package:task_firebase/core/service/api.dart';
import 'package:task_firebase/core/service/singleton.dart';
import 'package:task_firebase/locator.dart';
import 'package:task_firebase/ui/base/base_controller.dart';

class MainManagerController extends BaseController {
  final Api _api = Api(BaseTable.posts);

  List<PostModel> get list => data.map((e) => PostModel(e)).toList();

  @override
  Stream<QuerySnapshot<Object?>?>? loadDataStream() {
    return _api.streamDataComplex(
        parentID: locator<Singleton>().userModel.id,
        childTable: BaseTable.userPosts);
  }
}
