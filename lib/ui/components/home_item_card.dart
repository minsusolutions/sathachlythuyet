import 'package:flutter/material.dart';
import 'package:sathach/domain/models/home/home_item.dart';

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
