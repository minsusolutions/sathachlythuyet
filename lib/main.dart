import 'package:flutter/material.dart';
import 'package:sathachlaixe/dependencies/dependencies.dart';
import 'package:sathachlaixe/routing/router.dart';

Future<void> main() async {
  await setupDependencies();
  runApp(const SatHachLaiXeApp());
}

class SatHachLaiXeApp extends StatelessWidget {
  const SatHachLaiXeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
      title: 'Ôn thi lý thuyết',
      debugShowCheckedModeBanner: false,
    );
  }
}
