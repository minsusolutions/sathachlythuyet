import 'package:flutter/material.dart';
import 'package:sathachlaixe/screens/revise/domain/data/chapter.dart';

class ReviseItemTile extends StatelessWidget {
  final Chapter chapter;
  const ReviseItemTile({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      height: 80,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Text(chapter.chapterType.chapterTitle),
            Text(chapter.chapterDescDetail),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: LinearProgressIndicator(value: 0.1)),
                  Text('10/200'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
