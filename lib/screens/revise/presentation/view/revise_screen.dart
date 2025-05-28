import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/commons/base_app_bar.dart';
import 'package:sathachlaixe/screens/revise/presentation/bloc/revise_bloc.dart';
import 'package:sathachlaixe/screens/revise/presentation/view/revise_page.dart';

class ReviseScreen extends StatelessWidget {
  const ReviseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: BlocSelector<ReviseBloc, ReviseState, String>(
          selector: (state) => 'A2',
          builder: (context, title) {
            return BaseAppBar(
              title: Text('Ôn thi hạng $title'),
              appBar: AppBar(),
              widgets: [],
            );
          },
        ),
      ),
      body: RevisePage(),
    );
  }
}
