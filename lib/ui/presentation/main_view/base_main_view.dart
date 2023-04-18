
import 'package:flutter/material.dart';

import 'package:task_firebase/ui/base_widget/form_data.dart';
import 'package:task_firebase/ui/base_widget/lf_appbar.dart';

abstract class BaseMainView extends StatelessWidget {
  const BaseMainView({
    Key? key,
  }) : super(key: key);
  String get titleAppbar;
  void onSubmitForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: LFAppBar(title: titleAppbar),
      body: FormData(
        onSubmit: onSubmitForm,
        list: listTextField,
        isFullScreen: true,
      ),
    );
  }

  List<Widget> get listTextField;
}
