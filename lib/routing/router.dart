import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sathachlaixe/screens/exam/data/ticker/ticker.dart';
import 'package:sathachlaixe/screens/exam/exam.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/mini_map/mini_map_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/timer/timer_bloc.dart';
import 'package:sathachlaixe/screens/exam_result/presentation/bloc/exam_result_bloc.dart';
import 'package:sathachlaixe/screens/exam_result/presentation/view/exam_result_screen.dart';
import 'package:sathachlaixe/screens/exam_set/presentation/bloc/exam_set_bloc.dart';
import 'package:sathachlaixe/screens/exam_set/presentation/view/exam_set_screen.dart';
import 'package:sathachlaixe/screens/home/home.dart';

import 'package:sathachlaixe/routing/router_utils.dart';
import 'package:sathachlaixe/routing/screen/not_found_page.dart';
import 'package:sathachlaixe/screens/revise/presentation/bloc/revise_bloc.dart';
import 'package:sathachlaixe/screens/revise/presentation/view/revise_screen.dart';
import 'package:sathachlaixe/screens/splash/presentation/bloc/app_start_bloc.dart';
import 'package:sathachlaixe/screens/splash/presentation/view/splash_screen.dart';

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
        path: PAGE.splash.screenPath,
        name: PAGE.splash.screenName,
        builder: (context, state) {
          return BlocProvider(
            create:
                (context) =>
                    AppStartBloc(splashRepository: GetIt.I.get())
                      ..add(AppStarted()),
            child: SplashScreen(),
          );
        },
      ),
      GoRoute(
        path: PAGE.home.screenPath,
        name: PAGE.home.screenName,
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
      ),
      GoRoute(
        path: PAGE.setting.screenPath,
        name: PAGE.setting.name,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      SettingBloc(settingRepository: GetIt.I.get())
                        ..add(LoadSettingEvent()),
              child: SettingScreen(title: PAGE.setting.screenTitle),
            ),
      ),
      GoRoute(
        path: PAGE.examSet.screenPath,
        name: PAGE.examSet.name,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      ExamSetBloc(examSetRepository: GetIt.I.get())
                        ..add(LoadExamSetEvent()),
              child: ExamSetScreen(title: PAGE.examSet.screenTitle),
            ),
      ),
      GoRoute(
        path: PAGE.exam.screenPath,
        name: PAGE.exam.name,
        builder: (context, state) {
          final String? examInfoKey = state.uri.queryParameters['examInfoKey'];
          final String? extra = state.uri.queryParameters['extra'];

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create:
                    (context) =>
                        ExamBloc(examRepository: GetIt.I.get())
                          ..add(LoadExam(examInfoKey, extra)),
              ),
              BlocProvider(create: (context) => MiniMapBloc()),
              BlocProvider(create: (context) => TimerBloc(ticker: Ticker())),
            ],
            child: ExamScreen(),
          );
        },
      ),
      GoRoute(
        path: PAGE.revise.screenPath,
        name: PAGE.revise.name,
        builder: (context, state) {
          return BlocProvider(
            create:
                (context) =>
                    ReviseBloc(reviseRepository: GetIt.I.get())
                      ..add(ReviseStarted()),
            child: ReviseScreen(),
          );
        },
      ),
      GoRoute(
        path:
            '/exam_result_view/:licienseId/:examCode/:examSetId', // Thêm examCode vào path
        builder: (BuildContext context, GoRouterState state) {
          final licenseId = int.parse(state.pathParameters['licienseId']!);
          final examCode = int.parse(
            state.pathParameters['examCode']!,
          ); // Lấy examCode
          final examSetId = int.tryParse(
            state.pathParameters['examSetId']!,
          ); // examSetId có thể null

          return BlocProvider(
            create:
                (context) =>
                    GetIt.instance<ExamResultBloc>()..add(
                      LoadExamResultEvent(
                        licenseId: licenseId,
                        examCode: examCode,
                        examSetId: examSetId,
                      ),
                    ),
            child: ExamResultView(
              licenseId: licenseId,
              examCode: examCode,
              examSetId: examSetId,
            ),
          );
        },
      ),
    ],

    errorBuilder: (context, state) => const NotFoundPage(),
  );

  static GoRouter get router => _router;
}
