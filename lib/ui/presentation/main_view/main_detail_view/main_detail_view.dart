import 'package:flutter/material.dart';
import 'package:task_firebase/core/model/post_model.dart';
import 'package:task_firebase/ui/presentation/main_view/base_main_view.dart';
import 'package:task_firebase/ui/presentation/main_view/main_detail_view/controller/main_detail_controller.dart';
import 'package:task_firebase/ui/base_widget/lf_text_field.dart';

class MainDetailView extends BaseMainView {
  MainDetailView({super.key, required this.model});
  final PostModel model;
  final MainDetailController controller = MainDetailController();

  @override
  String get titleAppbar => 'Dettail quizz';

  @override
  void onSubmitForm() {
    controller.updatePost(model.id);
  }

  @override
  List<Widget> get listTextField => [
        LFTextFormField(
          label: 'Title',
          initValue: model.title,
          onSaved: (p0) => controller.title = p0,
        ),
        LFTextFormField(
          label: 'Content',
          initValue: model.content,
          maxLines: null,
          onSaved: (p0) => controller.content = p0,
        ),
      ];
}
