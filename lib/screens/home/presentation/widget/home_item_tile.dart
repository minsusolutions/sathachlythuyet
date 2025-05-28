part of '../view/home_screen.dart';

class HomeItemTile extends StatelessWidget {
  const HomeItemTile({super.key, required this.homeItem});
  final HomeItem homeItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(homeItem.backgroundColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap:
            () => AppRouter.router.go(
              homeItem.page.screenPath,
              extra: homeItem.page,
            ),
        splashColor: Colors.grey.withValues(alpha: 0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              homeItem.imgUrl,
              height: 50,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            const SizedBox(height: 10),
            Text(
              homeItem.page.screenTitle,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
