import 'dart:math';

import '../../../../imports.dart';

class CustomCircularAvatar extends StatelessWidget {
  final String name;
  final double size;

  const CustomCircularAvatar({super.key, required this.name, this.size = 50.0});

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final int colorIndex = random.nextInt(Colors.primaries.length);
    final Color randomColor = Colors.primaries[colorIndex];

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: randomColor,
        shape: circleBoxShape,
      ),
      child: Center(
        child: Text(
          name.substring(0, 1).toUpperCase(),
          style: TextStyle(
            color: whiteColor,
            fontSize: size * 0.5,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}
