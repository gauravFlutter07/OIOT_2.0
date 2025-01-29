import '../../../../../../imports.dart';

class HatchbackSelectRideContainer extends StatelessWidget {
  final String imagePath;
  final String type;
  final String maxPillions;
  final String rupees;
  final String timeInfo;
  final String estimatedTime;
  final bool isActive;
  final VoidCallback callback;
  final VoidCallback infoCallBack;

  const HatchbackSelectRideContainer({
    super.key,
    required this.imagePath,
    required this.type,
    required this.maxPillions,
    required this.rupees,
    required this.estimatedTime,
    required this.timeInfo,
    required this.isActive,
    required this.callback,
    required this.infoCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: isActive ? blueMain : greyShade200,
        ),
        child: Row(
          children: [
            Padding(
              padding: padding10,
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Utils.showImg(imagePath, 50, 50),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      type,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: isActive ? whiteColor : blackColor,
                      ),
                    ),
                    width10,
                    Icon(
                      Icons.person_outline,
                      color: isActive ? whiteColor : blackColor,
                    ),
                    Text(
                      maxPillions,
                      style: TextStyle(
                        color: isActive ? whiteColor : blackColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "$timeInfo away Drop $estimatedTime ",
                      style: TextStyle(
                        color: isActive ? whiteColor : blackColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              '₹$rupees',
              style: TextStyle(
                color: isActive ? whiteColor : blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            width10,
            InkWell(
              onTap: infoCallBack,
              child: Icon(
                Icons.info,
                size: 30,
                color: isActive ? whiteColor : blackColor,
              ),
            ),
            width10,
          ],
        ),
      ),
    );
  }
}
