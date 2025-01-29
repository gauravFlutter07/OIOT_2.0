import '../imports.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final double? textSize;
  final double? optionalHeight;
  final Color? optionalColor;
  final Color? optionalTextColor;

  const CustomButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.textSize,
      this.optionalHeight,
      this.optionalColor,
      this.optionalTextColor,
      required bool border});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: optionalHeight,
      child: Material(
        color: (optionalColor) != null ? optionalColor : blueMain,
        borderRadius: BorderRadius.circular(5),
        elevation: 0.0,
        child: MaterialButton(
          onPressed: () {
            onTap();
          },
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color:
                  (optionalTextColor) != null ? optionalTextColor : whiteColor,
              fontSize: textSize ?? 18,
            ),
          ),
        ),
      ),
    );
  }
}
