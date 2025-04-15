import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:sathach/l10n/app_localizations.dart';
import 'package:sathach/ui/home/view_models/home_viewmodel.dart';
import 'package:sathach/ui/home/widgets/home_items_list.dart';

import '../../../domain/models/home/home_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});
  final HomeViewModel viewModel;

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.home_title)),
      body: SafeArea(minimum: const EdgeInsets.all(16), child: HomeItemsList(viewModel: widget.viewModel)),
    );
  }
}



//Components

class HomeItemCard extends StatelessWidget {
  final HomeItem homeItem;
  final Color cardColor;
  final void Function()? onTap;
  const HomeItemCard({
    super.key,
    required this.homeItem,
    required this.cardColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 0,
      margin: const EdgeInsets.all(8),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        splashColor: Colors.lightGreenAccent.withAlpha(30),
        onTap: onTap,
        //sizedBox of the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 200,
              child: Text(
                homeItem.title,
                style: const TextStyle(
                  fontSize: 19,
                  color: Color(0xffeeeeee),
                ), // textstyle
              ),
            ), //text //SizedBox
          ], // <widget>[]
        ), // column
      ), //inkwell
    ); // card
  }
}
