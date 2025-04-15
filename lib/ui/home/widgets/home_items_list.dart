
import 'package:flutter/material.dart';
import 'package:sathach/ui/home/view_models/home_viewmodel.dart';

class HomeItemsList extends StatelessWidget {

  const HomeItemsList ({
    super.key,
    required this.viewModel
});
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final homeItems = viewModel.homeItems;

    return GridView.count(crossAxisCount: 2, children: List.generate(homeItems.length, (index) {
      return InkWell(
        child: Text(homeItems[index].title),
      );
    }));
  }
}