import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:sathach/config/dependencies.dart';
import 'package:sathach/routing/router.dart';
import 'package:sathach/styles/theme.dart';

import 'l10n/app_localizations.dart';

void main() {

  Logger.root.level = Level.ALL;
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      routerConfig: router(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      supportedLocales: [Locale('en'), Locale('vi')],
    );
  }
}
