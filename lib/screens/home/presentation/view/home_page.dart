part of 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Widget withBloc() {
    return BlocProvider(
      create: (context) => HomeBloc(homeRepository: GetIt.I.get()),
      child: HomePage(),
    );
  }

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = context.read<HomeBloc>();
    _homeBloc.add(const LoadHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(height: 150, child: HomeStatusView()),
        Expanded(child: HomeItemListView()),
        // Container(
        //   height: 100,
        //   child: Container(decoration: BoxDecoration(color: Colors.amber)),
        // ),
      ],
    );
  }
}
