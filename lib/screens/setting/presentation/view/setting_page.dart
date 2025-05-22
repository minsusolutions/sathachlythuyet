import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/routing/router.dart';
import 'package:sathachlaixe/screens/setting/presentation/bloc/setting_bloc.dart';
import 'package:sathachlaixe/screens/setting/presentation/widget/liciense_tile.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final ScrollController scrollController = ScrollController();

  late final SettingBloc _settingBloc;
  final _logger = Logger('SettingPage');

  @override
  Widget build(BuildContext context) {
    var shouldPopToHome = false;

    return BlocConsumer<SettingBloc, SettingState>(
      listenWhen: (previous, current) {
        if (previous.currentLiciense.id == -1) return false;
        shouldPopToHome =
            previous.currentLiciense.id != current.currentLiciense.id;
        return shouldPopToHome;
      },
      listener: (context, state) {
        AppRouter.router.pop(true);
      },
      buildWhen: (previous, current) {
        return !shouldPopToHome;
      },

      builder: (context, state) {
        if (state.loadingResult.isInProgress) {
          return const CircularProgressIndicator();
        }
        if (state.loadingResult.isError) {
          return const Text('Something went wrong');
      }
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: ListView.separated(
            controller: scrollController,
            itemBuilder: (context, position) {
              if (scrollController.hasClients) {
                if (state.currentLiciense.id == state.licienses[position].id &&
                    state.currentLiciense.id > 5) {
                  if (state.currentLiciense.id < state.licienses.length - 5 &&
                      scrollController.position.hasContentDimensions) {
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: Duration(seconds: 1),
                      curve: Curves.ease,
                    );
                  } else {
                    scrollController.animateTo(
                      state.currentLiciense.id * 70,
                      duration: Duration(seconds: 1),
                      curve: Curves.ease,
                    );
                  }
                }
              }

              return LicienseTile(
                liciense: state.licienses[position],
                isSelected:
                    state.currentLiciense.id == state.licienses[position].id,
                onTap: () {
                  if (state.currentLiciense?.id !=
                      state.licienses[position].id) {
                    context.read<SettingBloc>().add(
                      SelectLicienseEvent(liciense: state.licienses[position]),
                    );
                  }
                },
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(color: Colors.blueGrey, thickness: 1);
            },
            itemCount: state.licienses.length,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
