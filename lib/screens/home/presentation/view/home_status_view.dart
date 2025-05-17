part of 'home_screen.dart';

class HomeStatusView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hanh trinh chinh phuc hang A'),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 150, height: 150, child: getRadialGauge()),
              Container(width: 150, height: 150, child: getRadialGauge()),
            ],
          ),
        ),
      ],
    );
  }
}
