part of '../view/home_screen.dart';

class HomeItemListView extends StatelessWidget {
  const HomeItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) {
        return current.examInfo != null;
      },
      listener: (context, state) {},
      builder: (context, state) {
        if (state.homeItems.isEmpty) {
          return Container(decoration: BoxDecoration(color: Colors.purple));
        }
        return GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 2,
          children: List.generate(state.homeItems.length, (index) {
            return HomeItemCard(
              homeItem: state.homeItems[index],
              onTap:
                  () => {
                    AppRouter.router.go(
                      state.homeItems[index].route,
                      extra: state.homeItems[index].jobCode,
                    ),
                  },
            );
          }),
        );
      },
    );
  }
}
