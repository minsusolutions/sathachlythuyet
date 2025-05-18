part of 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _logger = Logger('_HomePageState');

  @override
  void initState() {
    _logger.info('initState');
    context.read<HomeBloc>().add(LoadHomeEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _logger.info('didChangeDependencies');
    super.didChangeDependencies();
  }

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
