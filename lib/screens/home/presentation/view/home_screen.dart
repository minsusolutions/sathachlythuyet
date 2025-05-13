import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sathachlaixe/commons/base_app_bar.dart';
import 'package:sathachlaixe/routing/router.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sathachlaixe/screens/home/domain/model/home_item.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/home/presentation/bloc/home_bloc.dart';

part 'home_page.dart';
part '../widget/home_item_tile.dart';
part 'home_status_view.dart';
part '../widget/home_item_list_view.dart';

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
      body: HomePage.withBloc(),
    );
  }
}
