part of '../view/home_screen.dart';

class HomeItemListView extends StatelessWidget {
  const HomeItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, List<HomeItem>?>(
      selector: (state) => state.homeItems,
      builder: (context, lists) {
        if (lists == null) {
          return Container(decoration: BoxDecoration(color: Colors.tealAccent));
        }
        if (lists.isEmpty) {
          return Container(decoration: BoxDecoration(color: Colors.purple));
        }
        return GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 2,
          children: List.generate(lists!.length, (index) {
            return HomeItemCard(
              homeItem: lists[index],
              onTap:
                  () => {
                    AppRouter.router.go(
                      lists[index].route,
                      extra: ExamInfo(
                        licienseId: 1,
                        examCode: 1,
                        examSetId: 1,
                        questions: [
                          QuestionData(
                            questionId: 1,
                            questionStatus: QuestionStatus.unanswer,
                          ),
                          QuestionData(
                            questionId: 74,
                            questionStatus: QuestionStatus.unanswer,
                          ),
                          QuestionData(
                            questionId: 73,
                            questionStatus: QuestionStatus.unanswer,
                          ),
                          QuestionData(
                            questionId: 4,
                            questionStatus: QuestionStatus.unanswer,
                          ),
                          QuestionData(
                            questionId: 72,
                            questionStatus: QuestionStatus.incorrect,
                          ),
                          QuestionData(
                            questionId: 6,
                            questionStatus: QuestionStatus.unanswer,
                          ),
                          QuestionData(
                            questionId: 7,
                            questionStatus: QuestionStatus.correct,
                          ),
                          QuestionData(
                            questionId: 8,
                            questionStatus: QuestionStatus.unanswer,
                          ),
                        ],
                        examTitle: 'De thi so 1 - Giay phep hang B',
                        status: ExamStatus.initial,
                        examType: ExamType.exam,
                        duration: 20 * 60,
                        minCorrQuestion: 5,
                      ),
                    ),
                  },
            );
          }),
        );
      },
    );
  }
}
