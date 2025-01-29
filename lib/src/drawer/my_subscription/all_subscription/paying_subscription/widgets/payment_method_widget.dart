import '../../../../../../imports.dart';

class PaymentMethodWidget extends StatelessWidget {
  final dynamic image;
  final String? title;
  final String? subTitle;
  const PaymentMethodWidget({this.title, this.subTitle, this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: topPadding10,
      color: backgroundWhite,
      child: Padding(
        padding: padding8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              alignment: centreAlignment,
              image: AssetImage(image),
            ),
            width20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: tsLargeBold,
                ),
                Text(
                  subTitle!,
                  style: tsRegularBold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
