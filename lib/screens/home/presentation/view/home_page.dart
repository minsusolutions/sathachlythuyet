part of 'home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 150, child: HomeStatusView()),
        Expanded(child: HomeItemListView()),
      ],
    );
  }
}
