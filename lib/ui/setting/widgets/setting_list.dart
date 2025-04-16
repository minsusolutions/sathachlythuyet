import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sathach/styles/colors.dart';
import 'package:sathach/ui/setting/view_models/setting_view_model.dart';

import '../../../domain/models/liciense.dart';
import '../../../l10n/app_localizations.dart';

typedef LicienseData = ({String licienseTitle, String licienseDesc});

class SettingList extends StatelessWidget {
  final SettingViewModel viewModel;
  const SettingList({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final licienseList = viewModel.licienseList;
    return ListView.separated(
      itemBuilder: (context, position) {
        return LicienseCard(
          liciense: licienseList[position],
          isSelected: viewModel.selectedIndex == position,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(color: Colors.blueGrey, thickness: 1);
      },
      itemCount: licienseList.length,
    );
  }
}

class LicienseCard extends StatelessWidget {
  const LicienseCard({
    super.key,
    required this.liciense,
    required this.isSelected,
  });
  final Liciense liciense;
  final bool isSelected;

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
        child: ListTile(
          title: Text(getLicienseTitle(context, liciense.licienseType)),
          subtitle: Text(getLicienseDesc(context, liciense.licienseType)),
          leading: SvgPicture.asset(
            leadingIcon(context, liciense.vehicleType),
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }

  String getLicienseTitle(BuildContext context, LicienseType licienseType) {
    String? data = "";
    switch (licienseType) {
      case LicienseType.a1:
        data = AppLocalizations.of(context)?.a1Title;
        break;
      case LicienseType.a:
        data = AppLocalizations.of(context)?.aTitle;
        break;
      case LicienseType.b1:
        data = AppLocalizations.of(context)?.b1Title;
        break;
      case LicienseType.b:
        data = AppLocalizations.of(context)?.bTitle;
        break;
      case LicienseType.c1:
        data = AppLocalizations.of(context)?.c1Title;
        break;
      case LicienseType.c:
        data = AppLocalizations.of(context)?.cTitle;
        break;
      case LicienseType.d1:
        data = AppLocalizations.of(context)?.d1Title;
        break;
      case LicienseType.d2:
        data = AppLocalizations.of(context)?.d2Title;
        break;
      case LicienseType.d:
        data = AppLocalizations.of(context)?.dTitle;
        break;
      case LicienseType.be:
        data = AppLocalizations.of(context)?.beTitle;
        break;
      case LicienseType.c1e:
        data = AppLocalizations.of(context)?.c1eTitle;
        break;
      case LicienseType.ce:
        data = AppLocalizations.of(context)?.ceTitle;
        break;
      case LicienseType.d1e:
        data = AppLocalizations.of(context)?.d1eTitle;
        break;
      case LicienseType.d2e:
        data = AppLocalizations.of(context)?.d2eTitle;
        break;
      case LicienseType.de:
        data = AppLocalizations.of(context)?.deTitle;
        break;
      default:
        data = "";
    }

    return data ?? "";
  }

  String getLicienseDesc(BuildContext context, LicienseType licienseType) {
    String? data = "";
    switch (licienseType) {
      case LicienseType.a1:
        data = AppLocalizations.of(context)?.a1Desc;
        break;
      case LicienseType.a:
        data = AppLocalizations.of(context)?.aDesc;
        break;
      case LicienseType.b1:
        data = AppLocalizations.of(context)?.b1Desc;
        break;
      case LicienseType.b:
        data = AppLocalizations.of(context)?.bDesc;
        break;
      case LicienseType.c1:
        data = AppLocalizations.of(context)?.c1Desc;
        break;
      case LicienseType.c:
        data = AppLocalizations.of(context)?.cDesc;
        break;
      case LicienseType.d1:
        data = AppLocalizations.of(context)?.d1Desc;
        break;
      case LicienseType.d2:
        data = AppLocalizations.of(context)?.d2Desc;
        break;
      case LicienseType.d:
        data = AppLocalizations.of(context)?.dDesc;
        break;
      case LicienseType.be:
        data = AppLocalizations.of(context)?.beDesc;
        break;
      case LicienseType.c1e:
        data = AppLocalizations.of(context)?.c1eDesc;
        break;
      case LicienseType.ce:
        data = AppLocalizations.of(context)?.ceDesc;
        break;
      case LicienseType.d1e:
        data = AppLocalizations.of(context)?.d1eDesc;
        break;
      case LicienseType.d2e:
        data = AppLocalizations.of(context)?.d2eDesc;
        break;
      case LicienseType.de:
        data = AppLocalizations.of(context)?.deDesc;
        break;
      default:
        data = "";
    }

    return data ?? "";
  }

  String leadingIcon(BuildContext context, VehicleType vehicleType) {
    if (vehicleType == VehicleType.motor) {
      return ('assets/icons/ic_motor.svg');
    } else if (vehicleType == VehicleType.car) {
      return ('assets/icons/ic_car.svg');
    } else {
      return ('assets/icons/ic_sidecar.svg');
    }
  }

  //
  // if (liciense.vehicleType == VehicleType.motor) {
  // SvgPicture.asset('assets/icons/ic_motor.svg', height: 30,);
  // } else if (liciense.vehicleType == VehicleType.car) {
  // SvgPicture.asset('assets/icons/ic_car.svg', height: 30);
  // } else {
  // SvgPicture.asset('assets/icons/ic_sidecar.svg',, height: 30);
  // }
}
