import 'package:flutter/material.dart';
import 'package:sathachlaixe/screens/home/view/home_item_list_view.dart';
import 'package:sathachlaixe/screens/home/view/home_status_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 150, child: HomeStatusView()),
        Expanded(child: HomeItemListView()),
        Container(
          height: 100,
          child: Container(decoration: BoxDecoration(color: Colors.amber)),
        ),
      ],
    );
  }
}
