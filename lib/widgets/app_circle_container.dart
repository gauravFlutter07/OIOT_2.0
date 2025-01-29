import '../imports.dart';

class CircleContainer extends StatelessWidget {
  final double size;
  final Color color;
  final Widget child;

  const CircleContainer({
    super.key,
    required this.size,
    required this.color,
    required this.child,
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
      child: Center(child: child),
    );
  }
}
