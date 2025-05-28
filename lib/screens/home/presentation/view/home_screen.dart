import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/base_app_bar.dart';
import 'package:sathachlaixe/routing/router.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sathachlaixe/screens/home/domain/model/home_item.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/home/presentation/bloc/home_bloc.dart';
import 'package:sathachlaixe/screens/home/presentation/widget/first_status.dart';

part '../widget/home_item_tile.dart';
part 'home_status_view.dart';
part '../widget/home_item_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.shouldReloadPage});
  final bool shouldReloadPage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) {
        if (current is HomeLoaded) {
          return current.shouldGoToOtherScreen;
        }
        return false;
      },
      listener: (context, state) {},
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: BlocSelector<HomeBloc, HomeState, String>(
            selector: (state) {
              if (state is HomeLoaded) {
                return state.currentLiciense.licienseType.name;
              }
              return '';
            },
            builder: (context, licienseName) {
              return BaseAppBar(
                title: Text(
                  'Ôn thi lý thuyết hạng ${licienseName.toUpperCase()}',
                ),
                appBar: AppBar(),
                widgets: [
                  IconButton(
                    onPressed: () async {
                      final bool? result = await AppRouter.router.push(
                        PAGE.setting.screenPath,
                      );
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (result ?? false) {
                          context.read<HomeBloc>().add(LoadHomeEvent());
                        }
                      });
                    },
                    icon: Icon(Icons.settings),
                  ),
                ],
              );
            },
          ),
        ),
        body: Column(
          children: [
            Container(height: 150, child: HomeStatusView()),
            Expanded(child: HomeItemListView()),
          ],
        ),
      ),
    );
  }
}
