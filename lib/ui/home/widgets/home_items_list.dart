import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sathach/domain/models/home/home_item.dart';
import 'package:sathach/l10n/app_localizations.dart';
import 'package:sathach/routing/router.dart';
import 'package:sathach/styles/colors.dart';
import 'package:sathach/ui/home/view_models/home_viewmodel.dart';

class HomeItemsList extends StatelessWidget {
  const HomeItemsList({super.key, required this.viewModel});
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    final homeItems = viewModel.homeItems;
    final double itemHeight =
        (height - kToolbarHeight - 30 - (homeItems.length - 1) * 8) /
        (homeItems.length / 2);
    final double itemWidth = (width - 8 * 2) / 2;

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: itemWidth / itemHeight,
      children: List.generate(homeItems.length, (index) {
        return HomeItemCard(
          homeItem: homeItems[index],
          onTap: () => context.go(Routes.exam),
        );
      }),
    );
  }
}

class HomeItemCard extends StatelessWidget {
  const HomeItemCard({super.key, required this.homeItem, required this.onTap});
  final HomeItem homeItem;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: getItemColor(homeItem.order),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => onTap.call(),
        splashColor: Colors.grey.withValues(alpha: 0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              homeItem.imgUrl,
              height: 50,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            SizedBox(height: 10),
            Text(
              getItemTitle(context, homeItem.homeItemType),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Color getItemColor(int index) {
    switch (index) {
      case 0:
        return MyColors.red;
      case 1:
        return MyColors.green;
      case 2:
        return MyColors.orange;
      case 3:
        return MyColors.greyDark;
      case 4:
        return Colors.indigo;
      case 5:
        return Colors.deepPurple;
      case 6:
        return MyColors.orange;
      default:
        return MyColors.green;
    }
  }

  String getItemTitle(BuildContext context, HomeItemType itemType) {
    switch (itemType) {
      case HomeItemType.random:
        return (AppLocalizations.of(context)?.randomAssestmentTitle ?? "None");
      case HomeItemType.examSets:
        return (AppLocalizations.of(context)?.assestmentSetsTitle ?? "None");
      case HomeItemType.wrongAnswers:
        return (AppLocalizations.of(context)?.wrongAnswersTitle ?? "None");
      case HomeItemType.signs:
        return (AppLocalizations.of(context)?.signsTitle ?? "None");
      case HomeItemType.tips:
        return (AppLocalizations.of(context)?.tipsTitle ?? "None");
      case HomeItemType.deadQuestions:
        return (AppLocalizations.of(context)?.a60DeadQuestions ?? "None");
      case HomeItemType.top50Wrong:
        return (AppLocalizations.of(context)?.top50WrongQuestions ?? "None");
      default:
        return AppLocalizations.of(context)?.top50WrongQuestions ?? "None";
    }
  }
}
