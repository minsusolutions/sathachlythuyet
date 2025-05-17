import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/styles/styles.dart';

class LicienseTile extends StatelessWidget {
  final Liciense liciense;
  final bool isSelected;
  final Function()? onTap;

  const LicienseTile({
    super.key,
    required this.liciense,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected == true ? MyColors.blueIce : Colors.transparent,
        border:
            isSelected == true
                ? Border.all(color: MyColors.dark)
                : Border.all(color: Colors.transparent),
        borderRadius:
            isSelected == true ? BorderRadius.circular(8) : BorderRadius.zero,
      ),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Text('Hạng ${liciense.licienseType.name.toUpperCase()}'),
          subtitle: Text(liciense.description),
          leading: SvgPicture.asset(liciense.image, height: 30, width: 30),
        ),
      ),
    );
  }
}
