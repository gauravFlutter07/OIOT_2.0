import '../imports.dart';

class CustomCircularAvatar extends StatelessWidget {
  final String name;
  final double size;
  final Color color;

  const CustomCircularAvatar({
    super.key,
    required this.name,
    this.size = 50.0,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          name.substring(0, 1).toUpperCase(),
          style: TextStyle(
            color: whiteColor,
            fontSize: size * 0.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
