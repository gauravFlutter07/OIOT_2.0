import '../../../../imports.dart';

class ActiveContainer extends StatelessWidget {
  final String text;
  final Color color;
  final bool isActive;
  final VoidCallback callback;
  const ActiveContainer({
    super.key,
    required this.text,
    required this.isActive,
    required this.color,
    required this.callback,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isActive ? color : transperentColor,
          border: isActive
              ? null
              : Border.all(
                  color: borderGrey,
                  width: 1.2,
                ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: (isActive) ? whiteColor : textBlack,
          ),
        ),
      ),
    );
  }
}
