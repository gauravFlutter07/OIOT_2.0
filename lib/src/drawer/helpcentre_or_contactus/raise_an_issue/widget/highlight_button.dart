import '../../../../../imports.dart';

// ignore: must_be_immutable
class HighlightButton extends StatelessWidget {
  final String text;
  late bool state;

  HighlightButton({
    super.key,
    required this.text,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: state ? lightBlack : whiteColor,
          border: state
              ? null
              : Border.all(
                  width: 1,
                  color: whiteColor,
                ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(
              color: state ? Colors.white : lightBlack,
              fontSize: 16,
              fontWeight: fontWeight500,
            ),
          ),
        ),
      ),
    );
  }
}
