import 'package:flutter/material.dart';
import 'package:sathachlaixe/commons/base_app_bar.dart';
import 'package:sathachlaixe/screens/setting/view/setting_page.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Sat hach lai xe'),
        appBar: AppBar(),
        widgets: [],
      ),
      body: SettingPage(),
    );
  }
}
