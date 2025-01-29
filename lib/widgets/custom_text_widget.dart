// ignore_for_file: camel_case_types

import '../imports.dart';

class customTextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  const customTextWidget({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
