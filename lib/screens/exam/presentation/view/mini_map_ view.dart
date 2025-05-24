import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/mini_map/mini_map_bloc.dart';

class MiniMapView extends StatefulWidget {
  final List<QuestionData> listData;

  const MiniMapView({super.key, required this.listData});

  @override
  State<StatefulWidget> createState() => _MiniMapViewState();
}

class _MiniMapViewState extends State<MiniMapView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MiniMapBloc>(
      context,
    ).add(MiniMapLoadEvent(listData: widget.listData));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MiniMapBloc, MiniMapState>(
      builder: (context, state) {
        return switch (state) {
          MiniMapInitial _ => Center(child: Text('Loading data...')),
          MiniMapLoaded loadedState => Row(
            children: [
              GridView.count(
                crossAxisCount: loadedState.questionData.length >= 30 ? 2 : 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(loadedState.questionData.length, (
                  index,
                ) {
                  return SizedBox(
                    width: 13,
                    height: 13,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: switch (loadedState
                            .questionData[index]
                            .questionStatus) {
                          QuestionStatus.current => Colors.blue,
                          QuestionStatus.incorrect => Colors.red,
                          QuestionStatus.correct => Colors.green,
                          QuestionStatus.unanswer => Colors.grey,
                        },
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(width: 10),
              Text('15/ ${loadedState.questionData.length}'),
            ],
          ),
        };
      },
    );
  }
}
