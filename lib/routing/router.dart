import 'package:exam_repository/exam_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sathachlaixe/screens/exam_set/presentation/bloc/exam_set_bloc.dart';
import 'package:sathachlaixe/screens/exam_set/presentation/view/exam_set_screen.dart';
import 'package:sathachlaixe/screens/home/home.dart';
import 'package:sathachlaixe/screens/setting/setting.dart';
import '../screens/exam/exam.dart';

import 'package:sathachlaixe/routing/router_utils.dart';
import 'package:sathachlaixe/routing/screen/not_found_page.dart';

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
          // GoRoute(
          //   path: PAGES.setting.screenPath,
          //   name: PAGES.setting.name,
          //   builder:
          //       (context, state) => BlocProvider(
          //         create:
          //             (context) => SettingBloc(
          //               licienseRepository: context.read<LicienseRepository>(),
          //             )..add(LoadAllLicienseRequest()),
          //         child: SettingScreen(title: PAGES.setting.ScreenTitle),
          //       ),
          // ),
          // GoRoute(
          //   path: PAGES.exam.screenPath,
          //   name: PAGES.exam.name,
          //   builder:
          //       (context, state) => BlocProvider(
          //         create:
          //             (context) => SettingBloc(
          //               licienseRepository: context.read<LicienseRepository>(),
          //             )..add(LoadAllLicienseRequest()),
          //         child: ExamScreen(),
          //       ),
          // ),
          // GoRoute(
          //   path: PAGES.exam_set.screenPath,
          //   name: PAGES.exam_set.name,
          //   builder:
          //       (context, state) => BlocProvider(
          //         create:
          //             (context) => ExamSetBloc(
          //               licienseRepository: context.read<LicienseRepository>(),
          //               examRepository: context.read<ExamRepository>(),
          //             )..add(ExamSetStarted()),
          //         child: ExamSetScreen(),
          //       ),
          // ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );

  static GoRouter get router => _router;
}
