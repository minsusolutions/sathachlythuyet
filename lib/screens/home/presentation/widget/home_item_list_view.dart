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
                        examCode: 1,
                        examTitle: 'examTitle',
                        examType: ExamType.revise,
                        questions: {
                          1: null,
                          10: null,
                          23: null,
                          39: null,
                          52: null,
                          74: null,
                          88: null,
                          104: null,
                          117: null,
                          140: true,
                          159: null,
                          266: null,
                          318: null,
                          330: false,
                          377: null,
                          391: null,
                          416: null,
                          479: null,
                          495: null,
                          510: null,
                          539: null,
                          562: null,
                        },
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
