import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sathach/l10n/app_localizations.dart';
import 'package:sathach/ui/home/view_models/home_viewmodel.dart';
import 'package:sathach/ui/home/widgets/home_items_list.dart';

import '../../../routing/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.viewModel});
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 100,
        title: Text(AppLocalizations.of(context)!.home_title),
        actions: [
          IconButton(
            onPressed: () {
              context.go(Routes.setting);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: HomeItemsList(viewModel: viewModel),
      ),
    );
  }
}
