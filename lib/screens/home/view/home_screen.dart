import 'package:flutter/material.dart';
import 'package:sathachlaixe/commons/base_app_bar.dart';
import 'package:sathachlaixe/screens/home/view/home_page.dart';
import 'package:sathachlaixe/routing/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Sat hach lai xe'),
        appBar: AppBar(),
        widgets: [
          IconButton(
            onPressed: () {
              AppRouter.router.go(PAGES.setting.screenPath);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: HomePage(),
    );
  }
}
