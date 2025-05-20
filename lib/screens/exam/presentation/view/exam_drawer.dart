import 'package:flutter/material.dart';

class ExamDrawer extends StatefulWidget {
  final TabController tabController;

  ExamDrawer({super.key, required this.tabController});
  final List<int> listItem = [
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
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
  ];
  @override
  State<StatefulWidget> createState() => _ExamDrawerState();
}

class _ExamDrawerState extends State<ExamDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Drawer(
        child: Column(
          children: [
            SizedBox(height: 75),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(color: Colors.orange),
                child: GridView.count(
                  crossAxisCount: widget.listItem.length >= 30 ? 5 : 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1 / 1,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: List.generate(widget.listItem.length, (index) {
                    return QuestionCircle(
                      onTap: () => {widget.tabController.animateTo(0)},
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 75),
          ],
        ),
      ),
    );
  }
}

class QuestionCircle extends StatelessWidget {
  final Function onTap;

  const QuestionCircle({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: InkWell(onTap: () => onTap.call, child: Center(child: Text('1'))),
    );
  }
}
