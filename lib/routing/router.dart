import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sathachlaixe/screens/home/home.dart';

import 'package:sathachlaixe/routing/router_utils.dart';
import 'package:sathachlaixe/routing/screen/not_found_page.dart';

import '../screens/setting/setting.dart';

export 'router_utils.dart';
export './screen/not_found_page.dart';

class AppRouter {
  static final _rootNavigationiKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigationiKey,
    routes: [
      GoRoute(
        path: PAGES.home.screenPath,
        name: PAGES.home.screenName,
        builder: (context, state) {
          var shouldReloadPage = state.extra as bool? ?? false;

          return BlocProvider(
            create:
                (context) =>
                    HomeBloc(homeRepository: GetIt.I.get())
                      ..add(LoadHomeEvent()),
            child: HomeScreen(shouldReloadPage: shouldReloadPage),
          );
        },
        routes: [
          GoRoute(
            path: PAGES.setting.screenPath,
            name: PAGES.setting.name,
            builder:
                (context, state) => BlocProvider(
                  create:
                      (context) =>
                          SettingBloc(settingRepository: GetIt.I.get())
                            ..add(LoadSettingEvent()),
                  child: SettingScreen(title: PAGES.setting.ScreenTitle),
                ),
          ),
        ],
      ),
    ],

    errorBuilder: (context, state) => const NotFoundPage(),
  );

  static GoRouter get router => _router;
}
