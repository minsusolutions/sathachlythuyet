part of '../view/home_screen.dart';

class HomeItemCard extends StatelessWidget {
  const HomeItemCard({super.key, required this.homeItem, required this.onTap});
  final HomeItem homeItem;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(homeItem.backgroundColor),
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
            const SizedBox(height: 10),
            Text(homeItem.itemTitle, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
