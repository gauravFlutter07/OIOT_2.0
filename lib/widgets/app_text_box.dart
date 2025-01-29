import '../imports.dart';

class AppTextBox extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback fun;
  const AppTextBox({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.fun,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: Center(
            child: Text(
              text,
              style: tsRegularBold,
            ),
          ),
        ),
      ),
    );
  }
}
