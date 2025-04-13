import 'package:go_router/go_router.dart';
import 'package:sathach/ui/exam/widgets/exam_screen.dart';
import 'package:sathach/ui/exam_sets/widgets/exam_sets_screen.dart';
import 'package:sathach/ui/home/widgets/home_screen.dart';
import 'package:sathach/ui/revise/widgets/revise_screen.dart';
import 'package:sathach/ui/signs/widgets/signs_screen.dart';
import 'package:sathach/ui/tips/widgets/tips_screen.dart';
import 'package:sathach/ui/wrong_answers/widgets/wrong_answers_screen.dart';

abstract final class Routes {
  static const home = '/';
  static const exam = '/exam';
  static const examSets = '/sets';
  static const revise = '/revise';
  static const signs = '/signs';
  static const tips = '/tips';
  static const wrongAnswers = '/wrong';
}

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return HomeScreen();
      },
      routes: [
        GoRoute(
          path: Routes.exam,
          builder: (context, state) {
            return ExamScreen();
          },
        ),
        GoRoute(
          path: Routes.examSets,
          builder: (context, state) {
            return ExamSetsScreen();
          },
        ),
        GoRoute(
          path: Routes.revise,
          builder: (context, state) {
            return ReviseScreen();
          },
        ),
        GoRoute(
          path: Routes.signs,
          builder: (context, state) {
            return SignsScreen();
          },
        ),
        GoRoute(
          path: Routes.tips,
          builder: (context, state) {
            return TipsScreen();
          },
        ),
        GoRoute(
          path: Routes.wrongAnswers,
          builder: (context, state) {
            return WrongAnswersScreen();
          },
        ),
      ],
    ),
  ],
);
