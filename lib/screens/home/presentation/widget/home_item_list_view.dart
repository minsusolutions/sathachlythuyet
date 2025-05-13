part of '../view/home_screen.dart';

class HomeItemListView extends StatelessWidget {
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
              onTap: () => {AppRouter.router.go(lists[index].route)},
            );
          }),
        );
      },
    );
  }
}
