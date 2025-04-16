import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sathach/ui/setting/view_models/setting_view_model.dart';
import 'package:sathach/ui/setting/widgets/setting_list.dart';

import '../../../l10n/app_localizations.dart';
import '../../../routing/router.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key, required this.viewModel});
  final SettingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 100,
        title: Text(AppLocalizations.of(context)?.setting_title ?? "Thiết lập"),
        actions: [
          IconButton(
            onPressed: () {
              context.go(Routes.home);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SettingList(viewModel: viewModel),
      ),
    );
  }
}
