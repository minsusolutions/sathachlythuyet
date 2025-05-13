part of 'home_screen.dart';

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
            Text(homeItem.itemTitle, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Color getItemColor(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.green;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.brown;
      case 4:
        return Colors.indigo;
      case 5:
        return Colors.deepPurple;
      case 6:
        return Colors.orange;
      default:
        return Colors.green;
    }
  }
}
