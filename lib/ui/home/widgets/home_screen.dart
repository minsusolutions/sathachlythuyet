import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sathach/l10n/app_localizations.dart';
import 'package:sathach/ui/home/view_models/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.home_title)),
      body: SafeArea(minimum: const EdgeInsets.all(16), child: Column()),
    );
  }
}
