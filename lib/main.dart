import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:sathachlaixe/routing/router.dart';
import 'package:sathachlaixe/screens/home/data/repository/local_home_repository.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';

Future<void> _setupDependencies() async {
  final getIt = GetIt.instance;

  getIt.registerSingleton<HomeRepository>(LocalHomeRepository());
  return await getIt.allReady();
}

void main() async {
  await _setupDependencies();
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
      title: 'Sat hach lai xe',
      debugShowCheckedModeBanner: false,
    );
  }
}
