import 'package:exam_repository/exam_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sathachlaixe/screens/home/bloc/home_bloc.dart';
import 'package:sathachlaixe/screens/home/view/home_screen.dart';
import 'package:sathachlaixe/routing/router_utils.dart';
import 'package:sathachlaixe/routing/screen/not_found_page.dart';
import 'package:sathachlaixe/screens/setting/bloc/setting_bloc.dart';
import 'package:sathachlaixe/screens/setting/view/setting_screen.dart';

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
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => HomeBloc(
                    licienseRepository: context.read<LicienseRepository>(),
                  )..add(HomeSubscriptionReqeusted()),
              child: HomeScreen(),
            ),
        routes: [
          GoRoute(
            path: PAGES.setting.screenPath,
            builder:
                (context, state) => BlocProvider(
                  create:
                      (context) => SettingBloc(
                        licienseRepository: context.read<LicienseRepository>(),
                      )..add(LoadAllLicienseRequest()),
                  child: SettingScreen(),
                ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );

  static GoRouter get router => _router;
}
