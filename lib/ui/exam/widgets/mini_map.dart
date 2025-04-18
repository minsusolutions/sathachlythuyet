import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MiniMapView extends StatefulWidget {
  List<int> listItem = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    8,
    9,
    10,
    11,
    12,
    12,
  ];

  @override
  State<StatefulWidget> createState() => _MiniMapView();
}

class _MiniMapView extends State<MiniMapView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GridView.count(
          crossAxisCount: widget.listItem.length >= 30 ? 2 : 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: List.generate(widget.listItem.length, (index) {
            return SizedBox(
              width: 13,
              height: 13,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey),
              ),
            );
          }),
        ),
        SizedBox(width: 10),
        Text('15/45'),
      ],
    );
  }
}
