import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sathachlaixe/screens/setting/presentation/bloc/setting_bloc.dart';
import 'package:sathachlaixe/screens/setting/presentation/widget/liciense_tile.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  static Widget withBloc() {
    return BlocProvider(
      create: (context) => SettingBloc(settingRepository: GetIt.I.get()),
      child: SettingPage(),
    );
  }

  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late final SettingBloc _settingBloc;

  @override
  void initState() {
    super.initState();
    _settingBloc = context.read<SettingBloc>();
    _settingBloc.add(const LoadSetingEvent());
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return BlocBuilder<SettingBloc, SettingState>(
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
              return LicienseTile(
                liciense: state.licienses[position],
                isSelected: false,
                // state.currentLiciense.id == state.licienses[position].id,
                onTap: () {
                  // if (state.currentLiciense.id !=
                  //     state.licienses[position].id) {
                  //   context.read<SettingBloc>().add(
                  //     // LicienseSelected(liciense: state.licienses[position]),
                  //   );
                  // }
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
}
