import '../imports.dart';

class CustomButtonOnlyBorder extends StatelessWidget {
  final Function onTap;
  final String title;
  final double? textSize;
  final double? optionalHeight;
  final Color? optionalTextColor;

  const CustomButtonOnlyBorder({
    super.key,
    required this.onTap,
    required this.title,
    this.textSize,
    this.optionalHeight,
    this.optionalTextColor,
    required bool border,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: optionalHeight,
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 0.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: textGrey,
              width: 1,
            ),
          ),
          child: MaterialButton(
            onPressed: () {
              onTap();
            },
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: optionalTextColor ?? blackColor,
                fontSize: textSize ?? 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
