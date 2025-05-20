import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sathachlaixe/screens/exam/domain/model/exam_info.dart';
import 'package:sathachlaixe/screens/exam/exam.dart';
import 'package:sathachlaixe/screens/exam_set/presentation/bloc/exam_set_bloc.dart';
import 'package:sathachlaixe/screens/exam_set/presentation/view/exam_set_screen.dart';
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
          // var shouldReloadPage = state.extra as bool? ?? false;

          return BlocProvider(
            create:
                (context) =>
                    HomeBloc(homeRepository: GetIt.I.get())
                      ..add(LoadHomeEvent()),
            child: HomeScreen(shouldReloadPage: true),
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
                  child: SettingScreen(title: PAGES.setting.screenTitle),
                ),
          ),
          GoRoute(
            path: PAGES.exam_set.screenPath,
            name: PAGES.exam_set.name,
            builder:
                (context, state) => BlocProvider(
                  create:
                      (context) =>
                          ExamSetBloc(examSetRepository: GetIt.I.get())
                            ..add(LoadExamSetEvent()),
                  child: ExamSetScreen(title: PAGES.exam_set.screenTitle),
                ),
          ),
          GoRoute(
            path: PAGES.exam.screenPath,
            name: PAGES.exam.name,
            builder: (context, state) {
              var examInfo = state.extra as ExamInfo;
              return BlocProvider(
                create:
                    (context) =>
                        ExamBloc(examRepository: GetIt.I.get())
                          ..add(LoadExam(examInfo: examInfo)),
                child: ExamScreen(),
              );
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) {},

    errorBuilder: (context, state) => const NotFoundPage(),
  );

  static GoRouter get router => _router;
}
