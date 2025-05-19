import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget statusCoundView(int count, bool passed) {
  return Row(
    children: [
      Text(count.toString()),
      SizedBox(width: 5),
      SvgPicture.asset(
        passed
            ? 'assets/drawables/ic_passed.svg'
            : 'assets/drawables/ic_failed.svg',
        height: 20,
        width: 20,
        colorFilter: ColorFilter.mode(
          passed ? Colors.green : Colors.redAccent,
          BlendMode.srcIn,
        ),
      ),
    ],
  );
}
