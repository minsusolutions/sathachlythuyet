import 'package:exam_repository/exam_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          leading: SvgPicture.asset(
            leadingIcon(context, liciense),
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }

  String leadingIcon(BuildContext context, Liciense liciense) {
    switch (liciense.vehicleType) {
      case VehicleType.motor:
        return 'assets/drawables/ic_motor.svg';
      case VehicleType.tricycle:
        return 'assets/drawables/ic_sidecar.svg';
      default:
        return 'assets/drawables/ic_car.svg';
    }
  }
}
