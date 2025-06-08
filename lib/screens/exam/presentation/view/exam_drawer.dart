import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/mini_map/mini_map_bloc.dart';

class ExamDrawer extends StatefulWidget {
  final TabController tabController;

  const ExamDrawer({super.key, required this.tabController});

  @override
  State<StatefulWidget> createState() => _ExamDrawerState();
}

class _ExamDrawerState extends State<ExamDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MiniMapBloc, MiniMapState>(
      builder: (context, state) {
        return switch (state) {
          MiniMapInitial _ => Center(child: Text('loading data')),
          MiniMapLoaded loadedState => SizedBox(
            width: 400,
            child: Drawer(
              child: Column(
                children: [
                  SizedBox(height: 75),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(color: Colors.orange),
                      child: GridView.count(
                        crossAxisCount:
                            loadedState.questionData.length >= 30 ? 5 : 4,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 1 / 1,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: List.generate(
                          loadedState.questionData.length,
                          (index) {
                            return QuestionCircle(
                              questionData: loadedState.questionData[index],
                              questionIndexInExamSet: index,
                              onTap: () {
                                context.read<MiniMapBloc>().add(
                                  MiniMapSelectCurrentIndexFromTab(
                                    currentIndex: index,
                                  ),
                                );

                                if (Scaffold.of(context).isDrawerOpen) {
                                  Scaffold.of(context).closeDrawer();
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 75),
                ],
              ),
            ),
          ),
        };
      },
    );
  }
}

class QuestionCircle extends StatelessWidget {
  final VoidCallback onTap;
  final QuestionData questionData;
  final int questionIndexInExamSet;

  const QuestionCircle({
    super.key,
    required this.questionData,
    required this.questionIndexInExamSet,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: switch (questionData.questionStatus) {
          QuestionStatus.correct => Colors.green,
          QuestionStatus.incorrect => Colors.red,
          QuestionStatus.unanswer => Colors.blueGrey,
        },
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(child: Text('Câu ${questionIndexInExamSet + 1}')),
      ),
    );
  }
}
