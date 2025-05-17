part of 'home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 150, child: HomeStatusView()),
        Expanded(child: HomeItemListView()),
        // Container(
        //   height: 100,
        //   child: Container(decoration: BoxDecoration(color: Colors.amber)),
        // ),
      ],
    );
  }
}
