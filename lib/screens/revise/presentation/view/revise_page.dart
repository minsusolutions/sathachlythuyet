import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/revise/presentation/bloc/revise_bloc.dart';
import 'package:sathachlaixe/screens/revise/presentation/widget/revise_item_tile.dart';

class RevisePage extends StatelessWidget {
  const RevisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviseBloc, ReviseState>(
      builder: (context, state) {
        return switch (state) {
          ReviseInitial _ => Center(child: CircularProgressIndicator()),
          ReviseLoaded() => ListView.separated(
            itemBuilder: (context, index) {
              return ReviseItemTile(chapter: state.chapters[index]);
            },
            separatorBuilder:
                (context, index) =>
                    const Divider(color: Colors.blueGrey, thickness: 1),
            itemCount: state.chapters.length,
          ),
        };
      },
    );
  }
}
