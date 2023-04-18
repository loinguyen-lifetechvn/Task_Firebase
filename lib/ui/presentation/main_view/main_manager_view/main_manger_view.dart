import 'package:flutter/material.dart';
import 'package:task_firebase/core/model/post_model.dart';
import 'package:task_firebase/core/service/get_navigation.dart';
import 'package:task_firebase/locator.dart';
import 'package:task_firebase/ui/presentation/main_view/main_manager_view/controller/main_manager_controller.dart';
import 'package:task_firebase/ui/base/base_view.dart';
import 'package:task_firebase/ui/base_widget/lf_appbar.dart';
import 'package:task_firebase/ui/resources/color_manager.dart';
import 'package:task_firebase/ui/resources/routes_manager.dart';
import 'package:task_firebase/ui/resources/styles_manager.dart';

class MainMangerView extends BaseView<MainManagerController> {
  MainMangerView({super.key}) : super(MainManagerController());

  @override
  Widget getMainView(BuildContext context, MainManagerController controller) {
    List<PostModel> list = controller.list;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: list.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (_, i) => cardPost(
        list[i],
      ),
    );
  }

  @override
  AppBar? appBar(BuildContext context) {
    return LFAppBar(
      title: 'Posts manager',
      suffix: IconButton(
          onPressed: () {
            locator<GetNavigation>().to(RouterPath.user);
          },
          icon: Icon(
            Icons.star,
            color: ColorManager.green,
          )),
    );
  }

  @override
  Widget? floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        locator<GetNavigation>().to(RouterPath.mainAdd);
      },
      child: const Icon(Icons.add),
    );
  }

  Widget cardPost(PostModel model) {
    return ListTile(
      onTap: () {
        locator<GetNavigation>().to(RouterPath.mainDetail, arguments: model);
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: ColorManager.greyTF)),
      title: Text(
        model.title,
        style: getTitleText(),
      ),
      subtitle: Text(
        model.content,
        style: getLabelText(color: ColorManager.greyBG),
      ),
    );
  }
}
