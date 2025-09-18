part of 'home_screen.dart';

class HomeStatusView extends StatelessWidget {
  final _logger = Logger('HomeStatusView');

  HomeStatusView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        if (current is HomeLoaded && previous is HomeLoaded) {
          _logger.info(
            'build: ${previous.currentLiciense.id != current.currentLiciense.id}',
          );
          return previous.currentLiciense.id != current.currentLiciense.id;
        }
        return false;
      },
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            // Text(
            //   'Hanh trinh chinh phuc hang ${state.currentLiciense.licienseType.name.toUpperCase()}',
            // ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
