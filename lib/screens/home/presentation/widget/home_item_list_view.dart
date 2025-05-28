part of '../view/home_screen.dart';

class HomeItemListView extends StatelessWidget {
  const HomeItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return switch (state) {
          HomeInitial _ => Container(
            decoration: BoxDecoration(color: Colors.purple),
          ),
          HomeLoaded loaded => GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 3 / 2,
            children: List.generate(loaded.homeItems.length, (index) {
              return HomeItemTile(homeItem: loaded.homeItems[index]);
            }),
          ),
        };
      },
    );
  }
}
