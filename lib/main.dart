import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:sathachlaixe/config/dependencies.dart';
import 'package:sathachlaixe/routing/router.dart';

void main() async {
  Logger.root.level = Level.ALL;
  WidgetsFlutterBinding.ensureInitialized;
  runApp(MultiProvider(providers: providers, child: const SatHachLaiXeApp()));
}

class SatHachLaiXeApp extends StatelessWidget {
  const SatHachLaiXeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
      title: 'Sat hach lai xe',
      debugShowCheckedModeBanner: false,
    );
  }
}
