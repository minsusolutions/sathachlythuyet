import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/exam_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/mini_map/mini_map_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/single_question_page.dart';

class QuestionPages extends StatefulWidget {
  const QuestionPages({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionPagesState();
}

class _QuestionPagesState extends State<QuestionPages>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _logger = Logger('_QuestionPagesState');

  @override
  void initState() {
    super.initState();
  }

  void _setActiveTabIndex() {
    var activeTabIndex = _tabController.index;
    print('active Tab Index $activeTabIndex');
    context.read<MiniMapBloc>().add(
      MiniMapUpdateCurrentIndex(currentIndex: activeTabIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MiniMapBloc, MiniMapState>(
      listenWhen: (previous, current) {
        if (previous is MiniMapLoaded && current is MiniMapLoaded) {
          return previous.updateTabControllerIndicator !=
              current.updateTabControllerIndicator;
        }
        return false;
      },
      listener: (context, state) {
        if (state is MiniMapLoaded) {
          _tabController.animateTo(state.currentQuestion);
        }
      },
      child: BlocConsumer<ExamBloc, ExamState>(
        listener: (context, state) {
          print('BlocConsumer listener');
        },
        builder: (context, state) {
          if (state is ExamInitial) {
            return Center(child: Text('Đang tải dữ liệu...'));
          }
          var finalState = state;
          if (finalState is ExamLoaded) {
            print('list question lenght: ${finalState.listQuestion.length}');
            _tabController = TabController(
              vsync: this,
              length: finalState.listQuestion.length,
            );
            _tabController.addListener(_setActiveTabIndex);

            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.amber),
                  height: 50,
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    controller: _tabController,
                    isScrollable: true,
                    tabs: List.generate(finalState.listQuestion.length, (
                      index,
                    ) {
                      return Text(
                        'Câu ${index + 1}',
                        style: TextStyle(color: Colors.red),
                      );
                      // return Tab(height: 50, text: 'Cau ${index + 1}',);
                    }),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey),
                    height: 100,
                    child: TabBarView(
                      controller: _tabController,
                      children: List<SingleQuestionPage>.generate(
                        finalState.listQuestion.length,
                        (index) => SingleQuestionPage(
                          question: finalState.listQuestion[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(child: Text('Đang tải dữ liệu'));
        },
      ),
    );
  }
}

// enum Answer { answer1, answer2, answer3, answer4 }
