// ignore_for_file: must_be_immutable, camel_case_types

import '../imports.dart';

class customTextWidget extends StatelessWidget {
  String text;
  double size;
  Color color;
  FontWeight weight;
  customTextWidget({
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
